import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'notification_item.freezed.dart';
part 'notification_item.g.dart';

@freezed
abstract class NotificationItem with _$NotificationItem {
  const factory NotificationItem({
    required int id,
    required String title,
    required String message,
    String? icon,
    @Default('unread') String status,
    required DateTime createdAt,
  }) = _NotificationItem;

  factory NotificationItem.fromJson(Map<String, dynamic> json) =>
      _$NotificationItemFromJson(json);
}