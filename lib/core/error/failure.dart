import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
abstract class Failure with _$Failure {
  const factory Failure.serverError([String? message]) = ServerError;
  const factory Failure.cacheError([String? message]) = CacheError;
  const factory Failure.invalidInput([String? message]) = InvalidInput;
  const factory Failure.database([String? message]) = DatabaseFailure;
}
