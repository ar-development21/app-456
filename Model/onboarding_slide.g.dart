// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_slide.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OnboardingSlide _$OnboardingSlideFromJson(Map<String, dynamic> json) =>
    _OnboardingSlide(
      title: json['title'] as String,
      description: json['description'] as String,
      icon: const IconDataConverter().fromJson((json['icon'] as num).toInt()),
      color: const ColorConverter().fromJson((json['color'] as num).toInt()),
    );

Map<String, dynamic> _$OnboardingSlideToJson(_OnboardingSlide instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'icon': const IconDataConverter().toJson(instance.icon),
      'color': const ColorConverter().toJson(instance.color),
    };
