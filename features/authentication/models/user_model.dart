import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "profile_image") String? profileImage,
    @JsonKey(name: "user_preference") String? userPreference,
    @JsonKey(name: "daily_learning_goals") String? dailyLearningGoals,
    // Agar googleId chahiye to:
    // @JsonKey(name: "google_id") String? googleId,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}


