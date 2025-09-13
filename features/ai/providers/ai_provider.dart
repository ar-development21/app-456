import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:notesmedia/features/ai/models/chat_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AiProvider extends ChangeNotifier {
  final List<ChatMessage> _chatHistory = [];
  final ImagePicker _picker = ImagePicker();

  final String _hardcodedToken =
      'oQtB7vmaH0W8mEuxbx3bWElxIK8jzqDfZvj7md5yXzjz12wwz18baUCgXIkR2RoG';

  String? _selectedImagePath;
  bool _isThinking = false;
  String? _errorMessage;

  /// New: Flag state for save history
  bool _saveHistory = true;
  bool get saveHistory => _saveHistory;

  /// Getters
  List<ChatMessage> get chatHistory => _chatHistory;
  String? get selectedImagePath => _selectedImagePath;
  bool get isThinking => _isThinking;
  String? get errorMessage => _errorMessage;

  AiProvider() {
    _loadHistory(); /// Load history when provider initializes
  }

  /// Toggle history saving
  void toggleSaveHistory() async {
    _saveHistory = !_saveHistory;
    notifyListeners();

    if (!_saveHistory) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove("chat_history"); // Clear storage
    } else {
      _saveHistoryToStorage(); // Save current history
    }
  }

  /// Save last 100 messages to SharedPreferences
  Future<void> _saveHistoryToStorage() async {
    if (!_saveHistory) return;
    final prefs = await SharedPreferences.getInstance();

    // Keep last 100 messages
    final lastMessages = _chatHistory.takeLast(100).toList();

    final historyJson = lastMessages
        .map((msg) => msg.toJson()) // ✅ make sure ChatMessage has `toJson`
        .toList();

    await prefs.setString("chat_history", jsonEncode(historyJson));
  }

  /// Load saved history
  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final savedData = prefs.getString("chat_history");

    if (savedData != null) {
      try {
        final List decoded = jsonDecode(savedData);
        _chatHistory.clear();
        _chatHistory.addAll(decoded.map((e) => ChatMessage.fromJson(e)));
        notifyListeners();
      } catch (e) {
        debugPrint("⚠️ Error loading history: $e");
      }
    }
  }

  /// Call this after every change
  void _onHistoryUpdated() {
    _saveHistoryToStorage();
  }

  /// Set selected image manually
  void setSelectedImage(String? imagePath) {
    _selectedImagePath = imagePath;
    notifyListeners();
  }

  /// Pick image using camera/gallery
  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        _selectedImagePath = pickedFile.path;
        notifyListeners();
      }
    } catch (e) {
      _errorMessage = 'Error picking image: $e';
      notifyListeners();
    }
  }

  /// Send user message to API
  Future<void> sendMessage(String userMessage) async {
    if (userMessage.trim().isEmpty && _selectedImagePath == null) return;

    _isThinking = true;
    _errorMessage = null;

    _chatHistory.add(ChatMessage.user(
      message: userMessage,
      imagePath: _selectedImagePath,
    ));

    _chatHistory.add(const ChatMessage.ai(message: '', isThinking: true));
    _selectedImagePath = null;
    notifyListeners();
    _onHistoryUpdated(); // ✅ save

    try {
      String? imageBase64;
      if (_selectedImagePath != null) {
        final bytes = await File(_selectedImagePath!).readAsBytes();
        imageBase64 = base64Encode(bytes);
      }

      final response = await http.post(
        Uri.parse('https://notesmedia.in/api/v1-ai'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_hardcodedToken',
        },
        body: jsonEncode({
          'prompt': userMessage,
          'image_base_64': imageBase64 ?? '',
          'history': [],
        }),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        if (jsonData['response'] != null) {
          _chatHistory[_chatHistory.length - 1] = ChatMessage.ai(
            message: jsonData['response'],
            isThinking: false,
          );
        } else {
          _handleError(jsonData['error'] ?? 'Unknown error');
        }
      } else {
        _handleError('Failed to connect to API. Status: ${response.statusCode}');
      }
    } catch (e) {
      _handleError('Error: $e');
    } finally {
      _isThinking = false;
      notifyListeners();
      _onHistoryUpdated(); // ✅ save
    }
  }

  /// Send user Feedback to API
  Future<void> sendFeedback(String responseText, String type, {String? feedback}) async {
    try {
      final feedbackData = {
        "responseText": responseText,
        "type": type,
        "feedback": feedback,
      };

      final response = await http.post(
        Uri.parse("https://notesmedia.in/api/feedback"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_hardcodedToken',
        },
        body: jsonEncode(feedbackData),
      );

      if (response.statusCode != 200) {
        debugPrint(" Feedback API failed: ${response.statusCode}");
      } else {
        debugPrint("✅ Feedback sent successfully");
      }
    } catch (e) {
      debugPrint("⚠️ Feedback API error: $e");
    }
  }

  /// Like toggle
  void toggleLike(int index) {
    _chatHistory[index].maybeWhen(
      ai: (message, isThinking, liked, disliked) {
        if (isThinking || liked || disliked) return;
        _chatHistory[index] = ChatMessage.ai(
          message: message,
          liked: true,
          disliked: false,
        );
        notifyListeners();
        sendFeedback(message, "like");
        _onHistoryUpdated(); // ✅ save
      },
      orElse: () {},
    );
  }

  /// Dislike toggle
  void toggleDislike(int index, {String? feedbackText}) {
    _chatHistory[index].maybeWhen(
      ai: (message, isThinking, liked, disliked) {
        if (isThinking || liked || disliked) return;
        _chatHistory[index] = ChatMessage.ai(
          message: message,
          liked: false,
          disliked: true,
        );
        notifyListeners();
        sendFeedback(message, "dislike", feedback: feedbackText);
        _onHistoryUpdated(); // ✅ save
      },
      orElse: () {},
    );
  }

  /// Error handling
  void _handleError(String error) {
    _chatHistory.removeLast();
    _errorMessage = error;
    _isThinking = false;
    notifyListeners();
    _onHistoryUpdated();
  }

  /// Clear chat completely
  void clearChat() async {
    _chatHistory.clear();
    _selectedImagePath = null;
    _errorMessage = null;
    _isThinking = false;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("chat_history");
  }
}

/// Extension: takeLast for List
extension TakeLastExtension<E> on List<E> {
  Iterable<E> takeLast(int n) => skip(length > n ? length - n : 0);
}
