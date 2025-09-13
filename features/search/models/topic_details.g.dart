// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TopicDetails _$TopicDetailsFromJson(Map<String, dynamic> json) =>
    _TopicDetails(
      topicName: json['topicName'] as String,
      courseId: json['courseId'] as String,
      topicNameId: json['topicNameId'] as String,
      content: json['content'] as String?,
      description: json['description'] as String?,
      resources: (json['resources'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastUpdated: json['lastUpdated'] as String?,
    );

Map<String, dynamic> _$TopicDetailsToJson(_TopicDetails instance) =>
    <String, dynamic>{
      'topicName': instance.topicName,
      'courseId': instance.courseId,
      'topicNameId': instance.topicNameId,
      'content': instance.content,
      'description': instance.description,
      'resources': instance.resources,
      'lastUpdated': instance.lastUpdated,
    };
