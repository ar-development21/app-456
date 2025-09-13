// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopicDetails {

 String get topicName; String get courseId; String get topicNameId; String? get content; String? get description; List<String>? get resources; String? get lastUpdated;
/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopicDetailsCopyWith<TopicDetails> get copyWith => _$TopicDetailsCopyWithImpl<TopicDetails>(this as TopicDetails, _$identity);

  /// Serializes this TopicDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopicDetails&&(identical(other.topicName, topicName) || other.topicName == topicName)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.topicNameId, topicNameId) || other.topicNameId == topicNameId)&&(identical(other.content, content) || other.content == content)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.resources, resources)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topicName,courseId,topicNameId,content,description,const DeepCollectionEquality().hash(resources),lastUpdated);

@override
String toString() {
  return 'TopicDetails(topicName: $topicName, courseId: $courseId, topicNameId: $topicNameId, content: $content, description: $description, resources: $resources, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class $TopicDetailsCopyWith<$Res>  {
  factory $TopicDetailsCopyWith(TopicDetails value, $Res Function(TopicDetails) _then) = _$TopicDetailsCopyWithImpl;
@useResult
$Res call({
 String topicName, String courseId, String topicNameId, String? content, String? description, List<String>? resources, String? lastUpdated
});




}
/// @nodoc
class _$TopicDetailsCopyWithImpl<$Res>
    implements $TopicDetailsCopyWith<$Res> {
  _$TopicDetailsCopyWithImpl(this._self, this._then);

  final TopicDetails _self;
  final $Res Function(TopicDetails) _then;

/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? topicName = null,Object? courseId = null,Object? topicNameId = null,Object? content = freezed,Object? description = freezed,Object? resources = freezed,Object? lastUpdated = freezed,}) {
  return _then(_self.copyWith(
topicName: null == topicName ? _self.topicName : topicName // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,topicNameId: null == topicNameId ? _self.topicNameId : topicNameId // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,resources: freezed == resources ? _self.resources : resources // ignore: cast_nullable_to_non_nullable
as List<String>?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TopicDetails].
extension TopicDetailsPatterns on TopicDetails {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopicDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopicDetails() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopicDetails value)  $default,){
final _that = this;
switch (_that) {
case _TopicDetails():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopicDetails value)?  $default,){
final _that = this;
switch (_that) {
case _TopicDetails() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String topicName,  String courseId,  String topicNameId,  String? content,  String? description,  List<String>? resources,  String? lastUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopicDetails() when $default != null:
return $default(_that.topicName,_that.courseId,_that.topicNameId,_that.content,_that.description,_that.resources,_that.lastUpdated);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String topicName,  String courseId,  String topicNameId,  String? content,  String? description,  List<String>? resources,  String? lastUpdated)  $default,) {final _that = this;
switch (_that) {
case _TopicDetails():
return $default(_that.topicName,_that.courseId,_that.topicNameId,_that.content,_that.description,_that.resources,_that.lastUpdated);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String topicName,  String courseId,  String topicNameId,  String? content,  String? description,  List<String>? resources,  String? lastUpdated)?  $default,) {final _that = this;
switch (_that) {
case _TopicDetails() when $default != null:
return $default(_that.topicName,_that.courseId,_that.topicNameId,_that.content,_that.description,_that.resources,_that.lastUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopicDetails implements TopicDetails {
  const _TopicDetails({required this.topicName, required this.courseId, required this.topicNameId, this.content, this.description, final  List<String>? resources, this.lastUpdated}): _resources = resources;
  factory _TopicDetails.fromJson(Map<String, dynamic> json) => _$TopicDetailsFromJson(json);

@override final  String topicName;
@override final  String courseId;
@override final  String topicNameId;
@override final  String? content;
@override final  String? description;
 final  List<String>? _resources;
@override List<String>? get resources {
  final value = _resources;
  if (value == null) return null;
  if (_resources is EqualUnmodifiableListView) return _resources;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? lastUpdated;

/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopicDetailsCopyWith<_TopicDetails> get copyWith => __$TopicDetailsCopyWithImpl<_TopicDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopicDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopicDetails&&(identical(other.topicName, topicName) || other.topicName == topicName)&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.topicNameId, topicNameId) || other.topicNameId == topicNameId)&&(identical(other.content, content) || other.content == content)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._resources, _resources)&&(identical(other.lastUpdated, lastUpdated) || other.lastUpdated == lastUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,topicName,courseId,topicNameId,content,description,const DeepCollectionEquality().hash(_resources),lastUpdated);

@override
String toString() {
  return 'TopicDetails(topicName: $topicName, courseId: $courseId, topicNameId: $topicNameId, content: $content, description: $description, resources: $resources, lastUpdated: $lastUpdated)';
}


}

/// @nodoc
abstract mixin class _$TopicDetailsCopyWith<$Res> implements $TopicDetailsCopyWith<$Res> {
  factory _$TopicDetailsCopyWith(_TopicDetails value, $Res Function(_TopicDetails) _then) = __$TopicDetailsCopyWithImpl;
@override @useResult
$Res call({
 String topicName, String courseId, String topicNameId, String? content, String? description, List<String>? resources, String? lastUpdated
});




}
/// @nodoc
class __$TopicDetailsCopyWithImpl<$Res>
    implements _$TopicDetailsCopyWith<$Res> {
  __$TopicDetailsCopyWithImpl(this._self, this._then);

  final _TopicDetails _self;
  final $Res Function(_TopicDetails) _then;

/// Create a copy of TopicDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? topicName = null,Object? courseId = null,Object? topicNameId = null,Object? content = freezed,Object? description = freezed,Object? resources = freezed,Object? lastUpdated = freezed,}) {
  return _then(_TopicDetails(
topicName: null == topicName ? _self.topicName : topicName // ignore: cast_nullable_to_non_nullable
as String,courseId: null == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String,topicNameId: null == topicNameId ? _self.topicNameId : topicNameId // ignore: cast_nullable_to_non_nullable
as String,content: freezed == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,resources: freezed == resources ? _self._resources : resources // ignore: cast_nullable_to_non_nullable
as List<String>?,lastUpdated: freezed == lastUpdated ? _self.lastUpdated : lastUpdated // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
