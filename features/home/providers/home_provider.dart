import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notesmedia/Model/Course_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceProvider with ChangeNotifier {
  String _userPreference = '';
  List<CourseModel> _courses = [];
  bool _isLoading = false;
  bool _hasError = false;
  bool _isUnsupportedPreference = false;

  String get userPreference => _userPreference;
  List<CourseModel> get courses => _courses;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;
  bool get isUnsupportedPreference => _isUnsupportedPreference;

  PreferenceProvider() {
    _loadPreference();
  }

  Future<void> _loadPreference() async {
    final prefs = await SharedPreferences.getInstance();
    _userPreference = prefs.getString('userPreference') ?? '';
    if (_userPreference.isNotEmpty) {
      await fetchCourses(_userPreference);
    }
    notifyListeners();
  }

  Future<void> updatePreference(String newPreference) async {
    _userPreference = newPreference;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userPreference', newPreference);
    await fetchCourses(newPreference);
    notifyListeners();
  }

  Future<void> fetchCourses(String preference) async {
    _isLoading = true;
    _hasError = false;
    _isUnsupportedPreference = false;
    _courses = [];
    notifyListeners();

    if (preference == 'B.C.A' || preference == 'B.Tech') {
      const apiUrl = 'https://notesmedia.in/api/get_courses';
      try {
        final response = await http.get(Uri.parse(apiUrl)).timeout(
          const Duration(seconds: 10),
          onTimeout: () => throw Exception('Request timed out'),
        );
        if (response.statusCode == 200) {
          final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
          if (jsonData['status'] == 'success') {
            _courses = (jsonData['data'] as List)
                .map((e) => CourseModel.fromJson(e as Map<String, dynamic>))
                .toList();
          } else {
            _hasError = true;
          }
        } else {
          _hasError = true;
        }
      } catch (e) {
        _hasError = true;
      }
    } else {
      _isUnsupportedPreference = preference != 'JEE Main';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> savePreferenceToApi(int userId, String preference) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('https://notesmedia.in/api/user/user_preference'),
        headers: {
          "Content-Type": "application/json",
          "Authorization":
          "Bearer oQtB7vmaH0W8mEuxbx3bWElxIK8jzqDfZvj7md5yXzjz12wwz18baUCgXIkR2RoG",
        },
        body: jsonEncode({
          "user_id": userId,
          "user_preference": preference,
        }),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw Exception('Request timed out'),
      );

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      if (response.statusCode == 200 && data['status'] == true) {
        final newPreference = data['user']?['user_preference'] as String? ?? preference;
        await updatePreference(newPreference);
      } else {
        throw Exception(data['message'] ?? 'Failed to save preference');
      }
    } catch (e) {
      _hasError = true;
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}