import 'package:freezed_annotation/freezed_annotation.dart';
part 'Course_model.freezed.dart';
part 'Course_model.g.dart';

@freezed
abstract class CourseModel with _$CourseModel {
  const factory CourseModel({
    @JsonKey(name: 'course_name') required String courseName,
    @JsonKey(name: 'short_description') required String shortDescription,
    @JsonKey(name: 'icon_name') required String iconName,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);
}