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





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  serverError,TResult Function()?  cacheError,TResult Function()?  invalidInput,TResult Function()?  database,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError();case CacheError() when cacheError != null:
return cacheError();case InvalidInput() when invalidInput != null:
return invalidInput();case DatabaseFailure() when database != null:
return database();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  serverError,required TResult Function()  cacheError,required TResult Function()  invalidInput,required TResult Function()  database,}) {final _that = this;
switch (_that) {
case ServerError():
return serverError();case CacheError():
return cacheError();case InvalidInput():
return invalidInput();case DatabaseFailure():
return database();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  serverError,TResult? Function()?  cacheError,TResult? Function()?  invalidInput,TResult? Function()?  database,}) {final _that = this;
switch (_that) {
case ServerError() when serverError != null:
return serverError();case CacheError() when cacheError != null:
return cacheError();case InvalidInput() when invalidInput != null:
return invalidInput();case DatabaseFailure() when database != null:
return database();case _:
  return null;

}
}

}

/// @nodoc


class ServerError implements Failure {
  const ServerError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.serverError()';
}


}




/// @nodoc


class CacheError implements Failure {
  const CacheError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.cacheError()';
}


}




/// @nodoc


class InvalidInput implements Failure {
  const InvalidInput();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InvalidInput);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.invalidInput()';
}


}




/// @nodoc


class DatabaseFailure implements Failure {
  const DatabaseFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DatabaseFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.database()';
}


}




// dart format on
