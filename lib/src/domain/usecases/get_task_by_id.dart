import 'package:fpdart/fpdart.dart';
import 'package:taskify/core/error/failure.dart';
import 'package:taskify/core/usecase/usecase.dart';
import 'package:taskify/src/domain/entites/task.dart' as task;
import 'package:taskify/src/domain/repositiory/task_repository.dart';

class GetTaskById implements UseCase<task.Task, int> {
  final TaskRepository repository;

  GetTaskById(this.repository);

  @override
  Future<Either<Failure, task.Task>> call(int id) async {
    return await repository.getTaskById(id);
  }
}
