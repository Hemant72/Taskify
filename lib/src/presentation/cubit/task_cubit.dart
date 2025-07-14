import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:taskify/core/error/failure.dart';
import 'package:taskify/core/services/notification_service.dart';
import 'package:taskify/core/usecase/usecase.dart';
import 'package:taskify/src/domain/entites/task.dart' as task;
import 'package:taskify/src/domain/usecases/create_task.dart';
import 'package:taskify/src/domain/usecases/delete_task.dart';
import 'package:taskify/src/domain/usecases/get_task.dart';
import 'package:taskify/src/domain/usecases/get_task_by_id.dart';
import 'package:taskify/src/domain/usecases/mark_task_complete.dart';
import 'package:taskify/src/domain/usecases/snooze_task.dart';
import 'package:taskify/src/domain/usecases/sort_task.dart';
import 'package:taskify/src/domain/usecases/update_task.dart';
import 'package:taskify/src/presentation/cubit/task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final NotificationService notificationService;
  final CreateTask createTask;
  final DeleteTask deleteTask;
  final GetTasks getTasks;
  final GetTaskById getTaskById;
  final MarkTaskComplete markTaskComplete;
  final SnoozeTask snoozeTask;
  final SortTasks sortTasks;
  final UpdateTask updateTask;

  TaskCubit({
    required this.createTask,
    required this.deleteTask,
    required this.getTasks,
    required this.getTaskById,
    required this.markTaskComplete,
    required this.snoozeTask,
    required this.sortTasks,
    required this.updateTask,
    required this.notificationService,
  }) : super(const TaskState());

  Future<void> fetchTasks() async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      final result = await getTasks(NoParams());
      result.fold(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (tasks) => emit(
          state.copyWith(isLoading: false, tasks: tasks, errorMessage: null),
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  Future<Either<Failure, task.Task>> fetchTaskById(int id) async {
    return await getTaskById(id);
  }

  Future<void> addTask(task.Task newTask) async {
    final result = await createTask(newTask);
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (created) {
        final updatedTasks = List<task.Task>.from(state.tasks)..add(created);
        emit(state.copyWith(tasks: updatedTasks, errorMessage: null));
        notificationService.scheduleTaskNotification(created);
      },
    );
  }

  Future<void> removeTask(int id) async {
    final result = await deleteTask(id);
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) {
        final updatedTasks = state.tasks
            .where((task) => task.id != id)
            .toList();
        emit(state.copyWith(tasks: updatedTasks, errorMessage: null));
      },
    );
  }

  Future<void> completeTask(task.Task task) async {
    final result = await markTaskComplete(task);
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) {
        final updatedTasks = state.tasks.map((t) {
          if (t.id == task.id) {
            return task.copyWith(isCompleted: true);
          }
          return t;
        }).toList();
        emit(state.copyWith(tasks: updatedTasks, errorMessage: null));
      },
    );
  }

  Future<void> postponeTask(task.Task task) async {
    final result = await snoozeTask(task);
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) => fetchTasks(),
    );
  }

  Future<void> sortTaskList(bool ascending) async {
    final result = await sortTasks(SortParams(ascending));
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (sortedTasks) =>
          emit(state.copyWith(tasks: sortedTasks, errorMessage: null)),
    );
  }

  Future<void> editTask(task.Task task) async {
    final result = await updateTask(task);
    result.fold(
      (failure) => emit(state.copyWith(errorMessage: failure.message)),
      (_) => fetchTasks(),
    );
  }
}
