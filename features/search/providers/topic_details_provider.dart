import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:notesmedia/features/search/models/topic_details.dart';

class TopicDetailsProvider extends ChangeNotifier {
  TopicDetails? _topicDetails;
  bool _isLoading = false;
  String? _errorMessage;
  final String _hardcodedToken = 'oQtB7vmaH0W8mEuxbx3bWElxIK8jzqDfZvj7md5yXzjz12wwz18baUCgXIkR2RoG';

  TopicDetails? get topicDetails => _topicDetails;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchTopicDetails({
    required String courseId,
    required String topicNameId,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    _topicDetails = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse("https://notesmedia.in/api/topics/$courseId/$topicNameId"),
        headers: {'Authorization': 'Bearer $_hardcodedToken'},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _topicDetails = TopicDetails.fromJson(data);
      } else {
        _errorMessage = 'Failed to fetch topic details: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Error fetching topic details: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear() {
    _topicDetails = null;
    _errorMessage = null;
    _isLoading = false;
    notifyListeners();
  }
}