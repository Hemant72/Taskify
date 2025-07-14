import 'package:fpdart/fpdart.dart';
import 'package:taskify/core/error/failure.dart';
import 'package:taskify/src/data/datasource/task_local_datasource.dart';
import 'package:taskify/src/data/model/task_model.dart';
import 'package:taskify/src/domain/entites/task.dart' as task;
import 'package:taskify/src/domain/repositiory/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource localDataSource;

  TaskRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<task.Task>>> getTasks() async {
    try {
      final tasks = await localDataSource.getTasks();
      return Right(tasks.map((model) => model.toEntity()).toList());
    } on Exception {
      return Left(CacheError());
    }
  }

  @override
  Future<Either<Failure, task.Task>> getTaskById(int id) async {
    try {
      final taskModel = await localDataSource.getTaskById(id);
      if (taskModel == null) {
        return Left(CacheError());
      }
      return Right(taskModel.toEntity());
    } on Exception {
      return Left(CacheError());
    }
  }

  @override
  Future<Either<Failure, task.Task>> createTask(task.Task task) async {
    try {
      final taskModel = TaskModel.fromEntity(task);
      final generatedId = await localDataSource.cacheTask(taskModel);
      final createdTask = task.copyWith(id: generatedId);
      return Right(createdTask);
    } on Exception {
      return Left(CacheError());
    }
  }

  @override
  Future<Either<Failure, void>> deleteTask(int id) async {
    try {
      await localDataSource.deleteTask(id);
      return Right(null);
    } on Exception {
      return Left(CacheError());
    }
  }

  @override
  Future<Either<Failure, void>> updateTask(task.Task task) async {
    try {
      await localDataSource.updateTask(TaskModel.fromEntity(task));
      return const Right(null);
    } on Exception {
      return Left(CacheError());
    }
  }
}
