// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FeedbackModel _$FeedbackModelFromJson(Map<String, dynamic> json) =>
    _FeedbackModel(
      responseText: json['responseText'] as String,
      type: json['type'] as String,
      feedback: json['feedback'] as String?,
    );

Map<String, dynamic> _$FeedbackModelToJson(_FeedbackModel instance) =>
    <String, dynamic>{
      'responseText': instance.responseText,
      'type': instance.type,
      'feedback': instance.feedback,
    };
