import 'package:fpdart/fpdart.dart';
import 'package:taskify/core/error/failure.dart';
import 'package:taskify/src/domain/entites/task.dart' as task;

abstract class TaskRepository {
  Future<Either<Failure, List<task.Task>>> getTasks();
  Future<Either<Failure, task.Task>> getTaskById(int id);
  Future<Either<Failure, task.Task>> createTask(task.Task task);
  Future<Either<Failure, void>> deleteTask(int id);
  Future<Either<Failure, void>> updateTask(task.Task task);
}
