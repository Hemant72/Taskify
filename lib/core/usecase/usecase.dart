import 'package:fpdart/fpdart.dart';
import 'package:taskify/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
