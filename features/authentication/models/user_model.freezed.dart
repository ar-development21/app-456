// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel {

@JsonKey(name: "user_id") int? get userId;@JsonKey(name: "full_name") String? get fullName;@JsonKey(name: "email") String? get email;@JsonKey(name: "profile_image") String? get profileImage;@JsonKey(name: "user_preference") String? get userPreference;@JsonKey(name: "daily_learning_goals") String? get dailyLearningGoals;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.userPreference, userPreference) || other.userPreference == userPreference)&&(identical(other.dailyLearningGoals, dailyLearningGoals) || other.dailyLearningGoals == dailyLearningGoals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,fullName,email,profileImage,userPreference,dailyLearningGoals);

@override
String toString() {
  return 'UserModel(userId: $userId, fullName: $fullName, email: $email, profileImage: $profileImage, userPreference: $userPreference, dailyLearningGoals: $dailyLearningGoals)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "user_id") int? userId,@JsonKey(name: "full_name") String? fullName,@JsonKey(name: "email") String? email,@JsonKey(name: "profile_image") String? profileImage,@JsonKey(name: "user_preference") String? userPreference,@JsonKey(name: "daily_learning_goals") String? dailyLearningGoals
});




}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = freezed,Object? fullName = freezed,Object? email = freezed,Object? profileImage = freezed,Object? userPreference = freezed,Object? dailyLearningGoals = freezed,}) {
  return _then(_self.copyWith(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,userPreference: freezed == userPreference ? _self.userPreference : userPreference // ignore: cast_nullable_to_non_nullable
as String?,dailyLearningGoals: freezed == dailyLearningGoals ? _self.dailyLearningGoals : dailyLearningGoals // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "user_id")  int? userId, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "email")  String? email, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "user_preference")  String? userPreference, @JsonKey(name: "daily_learning_goals")  String? dailyLearningGoals)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.userId,_that.fullName,_that.email,_that.profileImage,_that.userPreference,_that.dailyLearningGoals);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "user_id")  int? userId, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "email")  String? email, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "user_preference")  String? userPreference, @JsonKey(name: "daily_learning_goals")  String? dailyLearningGoals)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.userId,_that.fullName,_that.email,_that.profileImage,_that.userPreference,_that.dailyLearningGoals);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "user_id")  int? userId, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "email")  String? email, @JsonKey(name: "profile_image")  String? profileImage, @JsonKey(name: "user_preference")  String? userPreference, @JsonKey(name: "daily_learning_goals")  String? dailyLearningGoals)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.userId,_that.fullName,_that.email,_that.profileImage,_that.userPreference,_that.dailyLearningGoals);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel implements UserModel {
  const _UserModel({@JsonKey(name: "user_id") this.userId, @JsonKey(name: "full_name") this.fullName, @JsonKey(name: "email") this.email, @JsonKey(name: "profile_image") this.profileImage, @JsonKey(name: "user_preference") this.userPreference, @JsonKey(name: "daily_learning_goals") this.dailyLearningGoals});
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override@JsonKey(name: "user_id") final  int? userId;
@override@JsonKey(name: "full_name") final  String? fullName;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "profile_image") final  String? profileImage;
@override@JsonKey(name: "user_preference") final  String? userPreference;
@override@JsonKey(name: "daily_learning_goals") final  String? dailyLearningGoals;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.userPreference, userPreference) || other.userPreference == userPreference)&&(identical(other.dailyLearningGoals, dailyLearningGoals) || other.dailyLearningGoals == dailyLearningGoals));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,fullName,email,profileImage,userPreference,dailyLearningGoals);

@override
String toString() {
  return 'UserModel(userId: $userId, fullName: $fullName, email: $email, profileImage: $profileImage, userPreference: $userPreference, dailyLearningGoals: $dailyLearningGoals)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "user_id") int? userId,@JsonKey(name: "full_name") String? fullName,@JsonKey(name: "email") String? email,@JsonKey(name: "profile_image") String? profileImage,@JsonKey(name: "user_preference") String? userPreference,@JsonKey(name: "daily_learning_goals") String? dailyLearningGoals
});




}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = freezed,Object? fullName = freezed,Object? email = freezed,Object? profileImage = freezed,Object? userPreference = freezed,Object? dailyLearningGoals = freezed,}) {
  return _then(_UserModel(
userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String?,userPreference: freezed == userPreference ? _self.userPreference : userPreference // ignore: cast_nullable_to_non_nullable
as String?,dailyLearningGoals: freezed == dailyLearningGoals ? _self.dailyLearningGoals : dailyLearningGoals // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
