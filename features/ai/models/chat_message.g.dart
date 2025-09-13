// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserChatMessage _$UserChatMessageFromJson(Map<String, dynamic> json) =>
    UserChatMessage(
      message: json['message'] as String,
      imagePath: json['imagePath'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$UserChatMessageToJson(UserChatMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'imagePath': instance.imagePath,
      'runtimeType': instance.$type,
    };

AiChatMessage _$AiChatMessageFromJson(Map<String, dynamic> json) =>
    AiChatMessage(
      message: json['message'] as String,
      isThinking: json['isThinking'] as bool? ?? false,
      liked: json['liked'] as bool? ?? false,
      disliked: json['disliked'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$AiChatMessageToJson(AiChatMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'isThinking': instance.isThinking,
      'liked': instance.liked,
      'disliked': instance.disliked,
      'runtimeType': instance.$type,
    };
