import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_details.freezed.dart';
part 'topic_details.g.dart';

@freezed
abstract class TopicDetails with _$TopicDetails {
  const factory TopicDetails({
    required String topicName,
    required String courseId,
    required String topicNameId,
    String? content,
    String? description,
    List<String>? resources,
    String? lastUpdated,
  }) = _TopicDetails;

  factory TopicDetails.fromJson(Map<String, dynamic> json) =>
      _$TopicDetailsFromJson(json);
}