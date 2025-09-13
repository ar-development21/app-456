// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ChatMessage _$ChatMessageFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'user':
          return UserChatMessage.fromJson(
            json
          );
                case 'ai':
          return AiChatMessage.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'ChatMessage',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$ChatMessage {

 String get message;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ChatMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( UserChatMessage value)?  user,TResult Function( AiChatMessage value)?  ai,required TResult orElse(),}){
final _that = this;
switch (_that) {
case UserChatMessage() when user != null:
return user(_that);case AiChatMessage() when ai != null:
return ai(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( UserChatMessage value)  user,required TResult Function( AiChatMessage value)  ai,}){
final _that = this;
switch (_that) {
case UserChatMessage():
return user(_that);case AiChatMessage():
return ai(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( UserChatMessage value)?  user,TResult? Function( AiChatMessage value)?  ai,}){
final _that = this;
switch (_that) {
case UserChatMessage() when user != null:
return user(_that);case AiChatMessage() when ai != null:
return ai(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message,  String? imagePath)?  user,TResult Function( String message,  bool isThinking,  bool liked,  bool disliked)?  ai,required TResult orElse(),}) {final _that = this;
switch (_that) {
case UserChatMessage() when user != null:
return user(_that.message,_that.imagePath);case AiChatMessage() when ai != null:
return ai(_that.message,_that.isThinking,_that.liked,_that.disliked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message,  String? imagePath)  user,required TResult Function( String message,  bool isThinking,  bool liked,  bool disliked)  ai,}) {final _that = this;
switch (_that) {
case UserChatMessage():
return user(_that.message,_that.imagePath);case AiChatMessage():
return ai(_that.message,_that.isThinking,_that.liked,_that.disliked);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message,  String? imagePath)?  user,TResult? Function( String message,  bool isThinking,  bool liked,  bool disliked)?  ai,}) {final _that = this;
switch (_that) {
case UserChatMessage() when user != null:
return user(_that.message,_that.imagePath);case AiChatMessage() when ai != null:
return ai(_that.message,_that.isThinking,_that.liked,_that.disliked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class UserChatMessage implements ChatMessage {
  const UserChatMessage({required this.message, this.imagePath, final  String? $type}): $type = $type ?? 'user';
  factory UserChatMessage.fromJson(Map<String, dynamic> json) => _$UserChatMessageFromJson(json);

@override final  String message;
 final  String? imagePath;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserChatMessageCopyWith<UserChatMessage> get copyWith => _$UserChatMessageCopyWithImpl<UserChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserChatMessage&&(identical(other.message, message) || other.message == message)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,imagePath);

@override
String toString() {
  return 'ChatMessage.user(message: $message, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $UserChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory $UserChatMessageCopyWith(UserChatMessage value, $Res Function(UserChatMessage) _then) = _$UserChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String message, String? imagePath
});




}
/// @nodoc
class _$UserChatMessageCopyWithImpl<$Res>
    implements $UserChatMessageCopyWith<$Res> {
  _$UserChatMessageCopyWithImpl(this._self, this._then);

  final UserChatMessage _self;
  final $Res Function(UserChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? imagePath = freezed,}) {
  return _then(UserChatMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class AiChatMessage implements ChatMessage {
  const AiChatMessage({required this.message, this.isThinking = false, this.liked = false, this.disliked = false, final  String? $type}): $type = $type ?? 'ai';
  factory AiChatMessage.fromJson(Map<String, dynamic> json) => _$AiChatMessageFromJson(json);

@override final  String message;
@JsonKey() final  bool isThinking;
@JsonKey() final  bool liked;
@JsonKey() final  bool disliked;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiChatMessageCopyWith<AiChatMessage> get copyWith => _$AiChatMessageCopyWithImpl<AiChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AiChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiChatMessage&&(identical(other.message, message) || other.message == message)&&(identical(other.isThinking, isThinking) || other.isThinking == isThinking)&&(identical(other.liked, liked) || other.liked == liked)&&(identical(other.disliked, disliked) || other.disliked == disliked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,isThinking,liked,disliked);

@override
String toString() {
  return 'ChatMessage.ai(message: $message, isThinking: $isThinking, liked: $liked, disliked: $disliked)';
}


}

/// @nodoc
abstract mixin class $AiChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory $AiChatMessageCopyWith(AiChatMessage value, $Res Function(AiChatMessage) _then) = _$AiChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String message, bool isThinking, bool liked, bool disliked
});




}
/// @nodoc
class _$AiChatMessageCopyWithImpl<$Res>
    implements $AiChatMessageCopyWith<$Res> {
  _$AiChatMessageCopyWithImpl(this._self, this._then);

  final AiChatMessage _self;
  final $Res Function(AiChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? isThinking = null,Object? liked = null,Object? disliked = null,}) {
  return _then(AiChatMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,isThinking: null == isThinking ? _self.isThinking : isThinking // ignore: cast_nullable_to_non_nullable
as bool,liked: null == liked ? _self.liked : liked // ignore: cast_nullable_to_non_nullable
as bool,disliked: null == disliked ? _self.disliked : disliked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
