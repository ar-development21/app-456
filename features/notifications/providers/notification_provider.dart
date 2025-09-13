import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notesmedia/features/notifications/models/notification_item.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationItem> _notifications = [];
  String? _errorMessage;

  List<NotificationItem> get notifications => _notifications;
  String? get errorMessage => _errorMessage;

  Future<void> fetchNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final dynamic userIdDynamic = prefs.get('userId');
    final String? userId = userIdDynamic?.toString();

    if (userId == null) {
      _errorMessage = 'You must be logged in to see notifications.';
      notifyListeners();
      return;
    }

    _errorMessage = null;
    notifyListeners();

    final uri = Uri.parse('https://notesmedia.in/api/get_notifications?user_id=$userId');

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['status'] == 'success' && jsonData['data'] != null) {
          final List<dynamic> data = jsonData['data'];
          _notifications = data.map((item) => NotificationItem.fromJson(item)).toList();
        } else {
          _errorMessage = jsonData['message'] ?? 'Failed to load notifications';
        }
      } else {
        _errorMessage = 'Server error: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Could not connect to the server. Please check your connection.';
    }
    notifyListeners();
  }

  Future<void> markAsRead(NotificationItem notification) async {
    if (notification.status == 'unread') {
      final prefs = await SharedPreferences.getInstance();
      final dynamic userId = prefs.get('userId');

      if (userId == null) return;

      try {
        final uri = Uri.parse('https://notesmedia.in/api/mark_notification_read');
        final response = await http.post(
          uri,
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'user_id': userId,
            'notification_id': notification.id,
          }),
        );
        if (response.statusCode == 200) {
          final updatedNotification = notification.copyWith(status: 'read');
          _notifications = _notifications.map((n) => n.id == notification.id ? updatedNotification : n).toList();
        }
      } catch (e) {

      }
      notifyListeners();
    }
  }
}