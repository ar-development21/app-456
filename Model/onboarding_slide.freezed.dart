// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_slide.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OnboardingSlide {

 String get title; String get description;@IconDataConverter() IconData get icon;@ColorConverter() Color get color;
/// Create a copy of OnboardingSlide
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingSlideCopyWith<OnboardingSlide> get copyWith => _$OnboardingSlideCopyWithImpl<OnboardingSlide>(this as OnboardingSlide, _$identity);

  /// Serializes this OnboardingSlide to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingSlide&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,icon,color);

@override
String toString() {
  return 'OnboardingSlide(title: $title, description: $description, icon: $icon, color: $color)';
}


}

/// @nodoc
abstract mixin class $OnboardingSlideCopyWith<$Res>  {
  factory $OnboardingSlideCopyWith(OnboardingSlide value, $Res Function(OnboardingSlide) _then) = _$OnboardingSlideCopyWithImpl;
@useResult
$Res call({
 String title, String description,@IconDataConverter() IconData icon,@ColorConverter() Color color
});




}
/// @nodoc
class _$OnboardingSlideCopyWithImpl<$Res>
    implements $OnboardingSlideCopyWith<$Res> {
  _$OnboardingSlideCopyWithImpl(this._self, this._then);

  final OnboardingSlide _self;
  final $Res Function(OnboardingSlide) _then;

/// Create a copy of OnboardingSlide
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? icon = null,Object? color = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}

}


/// Adds pattern-matching-related methods to [OnboardingSlide].
extension OnboardingSlidePatterns on OnboardingSlide {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OnboardingSlide value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OnboardingSlide() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OnboardingSlide value)  $default,){
final _that = this;
switch (_that) {
case _OnboardingSlide():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OnboardingSlide value)?  $default,){
final _that = this;
switch (_that) {
case _OnboardingSlide() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description, @IconDataConverter()  IconData icon, @ColorConverter()  Color color)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OnboardingSlide() when $default != null:
return $default(_that.title,_that.description,_that.icon,_that.color);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description, @IconDataConverter()  IconData icon, @ColorConverter()  Color color)  $default,) {final _that = this;
switch (_that) {
case _OnboardingSlide():
return $default(_that.title,_that.description,_that.icon,_that.color);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description, @IconDataConverter()  IconData icon, @ColorConverter()  Color color)?  $default,) {final _that = this;
switch (_that) {
case _OnboardingSlide() when $default != null:
return $default(_that.title,_that.description,_that.icon,_that.color);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OnboardingSlide extends OnboardingSlide {
   _OnboardingSlide({required this.title, required this.description, @IconDataConverter() required this.icon, @ColorConverter() required this.color}): super._();
  factory _OnboardingSlide.fromJson(Map<String, dynamic> json) => _$OnboardingSlideFromJson(json);

@override final  String title;
@override final  String description;
@override@IconDataConverter() final  IconData icon;
@override@ColorConverter() final  Color color;

/// Create a copy of OnboardingSlide
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OnboardingSlideCopyWith<_OnboardingSlide> get copyWith => __$OnboardingSlideCopyWithImpl<_OnboardingSlide>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OnboardingSlideToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OnboardingSlide&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.color, color) || other.color == color));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,icon,color);

@override
String toString() {
  return 'OnboardingSlide(title: $title, description: $description, icon: $icon, color: $color)';
}


}

/// @nodoc
abstract mixin class _$OnboardingSlideCopyWith<$Res> implements $OnboardingSlideCopyWith<$Res> {
  factory _$OnboardingSlideCopyWith(_OnboardingSlide value, $Res Function(_OnboardingSlide) _then) = __$OnboardingSlideCopyWithImpl;
@override @useResult
$Res call({
 String title, String description,@IconDataConverter() IconData icon,@ColorConverter() Color color
});




}
/// @nodoc
class __$OnboardingSlideCopyWithImpl<$Res>
    implements _$OnboardingSlideCopyWith<$Res> {
  __$OnboardingSlideCopyWithImpl(this._self, this._then);

  final _OnboardingSlide _self;
  final $Res Function(_OnboardingSlide) _then;

/// Create a copy of OnboardingSlide
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? icon = null,Object? color = null,}) {
  return _then(_OnboardingSlide(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,icon: null == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as IconData,color: null == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color,
  ));
}


}

// dart format on
