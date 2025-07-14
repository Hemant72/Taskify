// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {

 String? get message;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = freezed,}) {
  return _then(_self.copyWith(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerError value)?  serverError,TResult Function( CacheError value)?  cacheError,TResult Function( InvalidInput value)?  invalidInput,TResult Function( DatabaseFailure value)?  database,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that);case CacheError() when cacheError != null:
return cacheError(_that);case InvalidInput() when invalidInput != null:
return invalidInput(_that);case DatabaseFailure() when database != null:
return database(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerError value)  serverError,required TResult Function( CacheError value)  cacheError,required TResult Function( InvalidInput value)  invalidInput,required TResult Function( DatabaseFailure value)  database,}){
final _that = this;
switch (_that) {
case ServerError():
return serverError(_that);case CacheError():
return cacheError(_that);case InvalidInput():
return invalidInput(_that);case DatabaseFailure():
return database(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerError value)?  serverError,TResult? Function( CacheError value)?  cacheError,TResult? Function( InvalidInput value)?  invalidInput,TResult? Function( DatabaseFailure value)?  database,}){
final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that);case CacheError() when cacheError != null:
return cacheError(_that);case InvalidInput() when invalidInput != null:
return invalidInput(_that);case DatabaseFailure() when database != null:
return database(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? message)?  serverError,TResult Function( String? message)?  cacheError,TResult Function( String? message)?  invalidInput,TResult Function( String? message)?  database,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that.message);case CacheError() when cacheError != null:
return cacheError(_that.message);case InvalidInput() when invalidInput != null:
return invalidInput(_that.message);case DatabaseFailure() when database != null:
return database(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? message)  serverError,required TResult Function( String? message)  cacheError,required TResult Function( String? message)  invalidInput,required TResult Function( String? message)  database,}) {final _that = this;
switch (_that) {
case ServerError():
return serverError(_that.message);case CacheError():
return cacheError(_that.message);case InvalidInput():
return invalidInput(_that.message);case DatabaseFailure():
return database(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? message)?  serverError,TResult? Function( String? message)?  cacheError,TResult? Function( String? message)?  invalidInput,TResult? Function( String? message)?  database,}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError(_that.message);case CacheError() when cacheError != null:
return cacheError(_that.message);case InvalidInput() when invalidInput != null:
return invalidInput(_that.message);case DatabaseFailure() when database != null:
return database(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ServerError implements Failure {
  const ServerError([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerErrorCopyWith<ServerError> get copyWith => _$ServerErrorCopyWithImpl<ServerError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.serverError(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerErrorCopyWith(ServerError value, $Res Function(ServerError) _then) = _$ServerErrorCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ServerErrorCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(this._self, this._then);

  final ServerError _self;
  final $Res Function(ServerError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(ServerError(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class CacheError implements Failure {
  const CacheError([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CacheErrorCopyWith<CacheError> get copyWith => _$CacheErrorCopyWithImpl<CacheError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.cacheError(message: $message)';
}


}

/// @nodoc
abstract mixin class $CacheErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $CacheErrorCopyWith(CacheError value, $Res Function(CacheError) _then) = _$CacheErrorCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$CacheErrorCopyWithImpl<$Res>
    implements $CacheErrorCopyWith<$Res> {
  _$CacheErrorCopyWithImpl(this._self, this._then);

  final CacheError _self;
  final $Res Function(CacheError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(CacheError(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class InvalidInput implements Failure {
  const InvalidInput([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InvalidInputCopyWith<InvalidInput> get copyWith => _$InvalidInputCopyWithImpl<InvalidInput>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidInput&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.invalidInput(message: $message)';
}


}

/// @nodoc
abstract mixin class $InvalidInputCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $InvalidInputCopyWith(InvalidInput value, $Res Function(InvalidInput) _then) = _$InvalidInputCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$InvalidInputCopyWithImpl<$Res>
    implements $InvalidInputCopyWith<$Res> {
  _$InvalidInputCopyWithImpl(this._self, this._then);

  final InvalidInput _self;
  final $Res Function(InvalidInput) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(InvalidInput(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class DatabaseFailure implements Failure {
  const DatabaseFailure([this.message]);
  

@override final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatabaseFailureCopyWith<DatabaseFailure> get copyWith => _$DatabaseFailureCopyWithImpl<DatabaseFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DatabaseFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.database(message: $message)';
}


}

/// @nodoc
abstract mixin class $DatabaseFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $DatabaseFailureCopyWith(DatabaseFailure value, $Res Function(DatabaseFailure) _then) = _$DatabaseFailureCopyWithImpl;
@override @useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$DatabaseFailureCopyWithImpl<$Res>
    implements $DatabaseFailureCopyWith<$Res> {
  _$DatabaseFailureCopyWithImpl(this._self, this._then);

  final DatabaseFailure _self;
  final $Res Function(DatabaseFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(DatabaseFailure(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
