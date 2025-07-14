import 'package:fpdart/fpdart.dart';
import 'package:taskify/core/error/failure.dart';
import 'package:taskify/core/usecase/usecase.dart';
import 'package:taskify/src/domain/entites/task.dart' as task;
import 'package:taskify/src/domain/repositiory/task_repository.dart';

class MarkTaskComplete implements UseCase<void, task.Task> {
  final TaskRepository repository;

  MarkTaskComplete(this.repository);

  @override
  Future<Either<Failure, void>> call(task.Task task) async {
    final updatedTask = task.copyWith(isCompleted: true);
    return await repository.updateTask(updatedTask);
  }
}
