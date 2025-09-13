// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  userId: (json['user_id'] as num?)?.toInt(),
  fullName: json['full_name'] as String?,
  email: json['email'] as String?,
  profileImage: json['profile_image'] as String?,
  userPreference: json['user_preference'] as String?,
  dailyLearningGoals: json['daily_learning_goals'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'full_name': instance.fullName,
      'email': instance.email,
      'profile_image': instance.profileImage,
      'user_preference': instance.userPreference,
      'daily_learning_goals': instance.dailyLearningGoals,
    };
