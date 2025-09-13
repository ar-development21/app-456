// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchResult _$SearchResultFromJson(Map<String, dynamic> json) =>
    _SearchResult(
      topic: json['topic'] as String,
      excerpt: json['excerpt'] as String?,
      slug: json['slug'] as String?,
      topicNameId: json['topicNameId'] as String?,
      courseId: json['courseId'] as String?,
    );

Map<String, dynamic> _$SearchResultToJson(_SearchResult instance) =>
    <String, dynamic>{
      'topic': instance.topic,
      'excerpt': instance.excerpt,
      'slug': instance.slug,
      'topicNameId': instance.topicNameId,
      'courseId': instance.courseId,
    };
