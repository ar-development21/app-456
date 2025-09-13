import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:notesmedia/features/authentication/models/auth_response.dart';
import 'package:notesmedia/features/authentication/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  final String apiBase = "https://notesmedia.in/api/user/";
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<AuthResponse?> login(String email, String password) async {
    _setLoading(true);
    try {
      final response = await http.post(
        Uri.parse("$apiBase/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw Exception('Request timed out'),
      );

      final data = AuthResponse.fromJson(jsonDecode(response.body));
      if (data.status && data.user != null) {
        await _saveUser(data.user!);
      }
      return data;
    } catch (e) {
      debugPrint("Login error: $e");
      return null;
    } finally {
      _setLoading(false);
    }
  }

  Future<AuthResponse?> register(String email, String password,String fullName) async {
    _setLoading(true);
    try {
      final response = await http.post(
        Uri.parse("$apiBase/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password,"full_name":fullName}),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw Exception('Request timed out'),
      );

      final data = AuthResponse.fromJson(jsonDecode(response.body));
      if (data.status && data.user != null) {
        await _saveUser(data.user!);
      }
      return data;
    } catch (e) {
      debugPrint("Register error: $e");
      return null;
    } finally {
      _setLoading(false);
    }
  }

  Future<AuthResponse?> googleSignIn() async {
    _setLoading(true);
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return null;
      }

      final String email = googleUser.email;
      final String googleId = googleUser.id;
      final String fullName = googleUser.displayName ?? '';
      final String photoUrl = googleUser.photoUrl ?? "https://notesmedia.in/images/default_profile.png";

      // 🔹 Step 1: Try Login
      final loginResponse = await http.post(
        Uri.parse("$apiBase/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "google_id": googleId,
        }),
      ).timeout(const Duration(seconds: 10), onTimeout: () => throw Exception("Login request timed out"));

      final loginData = AuthResponse.fromJson(jsonDecode(loginResponse.body));

      if (loginData.status && loginData.user != null) {
        await _saveUser(loginData.user!);
        return loginData;
      }

      // 🔹 Step 2: If login fails, try Register
      final regResponse = await http.post(
        Uri.parse("$apiBase/register"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "full_name": fullName,
          "email": email,
          "google_id": googleId,
          "profile_image": photoUrl,
        }),
      ).timeout(const Duration(seconds: 10), onTimeout: () => throw Exception("Register request timed out"));

      final regData = AuthResponse.fromJson(jsonDecode(regResponse.body));

      if (regData.status && regData.user != null) {
        await _saveUser(regData.user!);
        return regData;
      }

      return null;
    } catch (e) {
      debugPrint("Google Sign-In error: $e");
      return null;
    } finally {
      _setLoading(false);
    }
  }


  Future<void> _saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setInt('userId', user.userId ?? 0);
    await prefs.setString('userName', user.fullName ?? 'Student');
    await prefs.setString('userEmail', user.email ?? '');
    await prefs.setString('userPreference', user.userPreference ?? '');
    await prefs.setString('dailyLearningGoals', user.dailyLearningGoals ?? '');
    await prefs.setString('userPhotoUrl', user.profileImage ?? '');
  }
}