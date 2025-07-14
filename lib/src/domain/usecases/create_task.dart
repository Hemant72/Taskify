import 'package:fpdart/fpdart.dart';
import 'package:taskify/core/error/failure.dart';
import 'package:taskify/core/usecase/usecase.dart';
import 'package:taskify/src/domain/entites/task.dart' as task;
import 'package:taskify/src/domain/repositiory/task_repository.dart';

class CreateTask implements UseCase<task.Task, task.Task> {
  final TaskRepository repository;

  CreateTask(this.repository);

  @override
  Future<Either<Failure, task.Task>> call(task.Task task) async {
    return await repository.createTask(task);
  }
}
