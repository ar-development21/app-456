import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/auth_response.dart';
import '../models/user_model.dart';

class AuthRepository {
  final String apiBase = "https://notesmedia.in/api/user/";

  Future<AuthResponse> login(String email, String password) async {
    final response = await http.post(
      Uri.parse("$apiBase/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    return AuthResponse.fromJson(jsonDecode(response.body));
  }

  Future<AuthResponse> register(String email, String password) async {
    final response = await http.post(
      Uri.parse("$apiBase/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    return AuthResponse.fromJson(jsonDecode(response.body));
  }

  Future<void> saveUser(UserModel user, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", true);
    await prefs.setString("userEmail", email);
    await prefs.setString("userName", user.fullName ?? "Student");
    await prefs.setInt("userId", user.userId ?? 0);
    await prefs.setString("userPreference", user.userPreference ?? "");
    await prefs.setString("dailyLearningGoals", user.dailyLearningGoals ?? "");
    await prefs.setString("userPhotoUrl", user.profileImage ?? "");
  }
}
