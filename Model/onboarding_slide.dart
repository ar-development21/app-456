import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_slide.freezed.dart';
part 'onboarding_slide.g.dart';

@freezed
abstract class OnboardingSlide with _$OnboardingSlide {
  const OnboardingSlide._();

  factory OnboardingSlide({
    required String title,
    required String description,
    @IconDataConverter() required IconData icon,
    @ColorConverter() required Color color,
  }) = _OnboardingSlide;

  factory OnboardingSlide.fromJson(Map<String, dynamic> json) =>
      _$OnboardingSlideFromJson(json);
}
/// Custom Converter for IconData
class IconDataConverter implements JsonConverter<IconData, int> {
  const IconDataConverter();

  @override
  IconData fromJson(int json) => IconData(json, fontFamily: 'MaterialIcons');

  @override
  int toJson(IconData object) => object.codePoint;
}

/// Custom Converter for Color
class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) => object.value;
}

final List<OnboardingSlide> slides = [
  OnboardingSlide(
    icon: Icons.school_rounded,
    color: const Color(0xFF6366F1), // Indigo
    title: 'Welcome to NotesMedia',
    description:
    'A smart way to access BCA & B.Tech notes, old papers, and study resources anytime, anywhere.',
  ),
  OnboardingSlide(
    icon: Icons.lightbulb_outline_rounded,
    color: const Color(0xFFF59E0B), // Amber
    title: 'Learn Smarter',
    description:
    'Get structured study material, easy explanations, and resources that help you focus on what matters most.',
  ),
  OnboardingSlide(
    icon: Icons.people_alt_rounded,
    color: const Color(0xFF10B981), // Emerald
    title: 'Stay Connected',
    description:
    'Join a growing community of learners, ask doubts, share resources, and grow together.',
  ),
  OnboardingSlide(
    icon: Icons.auto_awesome,
    color: const Color(0xFF8B5CF6), // Violet
    title: 'NotesMedia AI',
    description: 'Your personal study buddy. Solve any doubt with simplified explanations.',
  ),
];

