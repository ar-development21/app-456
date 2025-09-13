import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage.user({
    required String message,
    String? imagePath,
  }) = UserChatMessage;

  const factory ChatMessage.ai({
    required String message,
    @Default(false) bool isThinking,
    @Default(false) bool liked,
    @Default(false) bool disliked,
  }) = AiChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);
}