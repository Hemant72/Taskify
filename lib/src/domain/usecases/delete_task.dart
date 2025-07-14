import 'package:fpdart/fpdart.dart';
import 'package:taskify/core/error/failure.dart';
import 'package:taskify/core/usecase/usecase.dart';
import 'package:taskify/src/domain/repositiory/task_repository.dart';

class DeleteTask implements UseCase<void, int> {
  final TaskRepository repository;

  DeleteTask(this.repository);

  @override
  Future<Either<Failure, void>> call(int id) async {
    return await repository.deleteTask(id);
  }
}
