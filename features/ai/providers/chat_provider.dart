import 'package:flutter/foundation.dart';
import 'package:notesmedia/features/ai/models/chat_message.dart';

class ChatProvider extends ChangeNotifier {
  final List<ChatMessage> _messages = [];
  bool _isThinking = false;

  List<ChatMessage> get messages => List.unmodifiable(_messages);
  bool get isThinking => _isThinking;

  void sendMessage(String text) {
    final userMessage = ChatMessage.user(message: text);
    _messages.add(userMessage);
    _isThinking = true;
    notifyListeners();

    // Simulate AI response
    Future.delayed(const Duration(seconds: 2), () {
      final aiMessage = ChatMessage.ai(
        message: "AI Response to: $text",
      );
      _messages.add(aiMessage);
      _isThinking = false;
      notifyListeners();
    });
  }

  void toggleLike(int index) {
    final msg = _messages[index];
    if (msg is AiChatMessage) {
      _messages[index] = msg.copyWith(
        liked: !msg.liked,
        disliked: false,
      );
      notifyListeners();
    }
  }

  void toggleDislike(int index) {
    final msg = _messages[index];
    if (msg is AiChatMessage) {
      _messages[index] = msg.copyWith(
        disliked: !msg.disliked,
        liked: false,
      );
      notifyListeners();
    }
  }
}
