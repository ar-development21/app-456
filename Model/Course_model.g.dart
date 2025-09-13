// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => _CourseModel(
  courseName: json['course_name'] as String,
  shortDescription: json['short_description'] as String,
  iconName: json['icon_name'] as String,
);

Map<String, dynamic> _$CourseModelToJson(_CourseModel instance) =>
    <String, dynamic>{
      'course_name': instance.courseName,
      'short_description': instance.shortDescription,
      'icon_name': instance.iconName,
    };
