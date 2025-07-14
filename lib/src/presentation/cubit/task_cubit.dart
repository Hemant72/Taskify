import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
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

part 'task_cubit.freezed.dart';
part 'task_state.dart';

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
  }) : super(const TaskState.initial());

  Future<void> fetchTasks() async {
    try {
      emit(state.copyWith(isLoading: true, errorMessage: null));

      final result = await getTasks(NoParams());
      result.fold(
        (failure) => emit(
          TaskState(
            isLoading: false,
            errorMessage: failure.message,
            tasks: state.tasks,
          ),
        ),
        (tasks) =>
            emit(TaskState(isLoading: false, tasks: tasks, errorMessage: null)),
      );
    } catch (e) {
      emit(
        TaskState(
          isLoading: false,
          errorMessage: e.toString(),
          tasks: state.tasks,
        ),
      );
    }
  }

  Future<Either<Failure, task.Task>> fetchTaskById(int id) async {
    return await getTaskById(id);
  }

  Future<void> addTask(task.Task task) async {
    final result = await createTask(task);
    result.fold(
      (failure) => emit(
        state.maybeWhen(
          orElse: () => TaskState(
            tasks: state.tasks,
            isLoading: state.isLoading,
            errorMessage: failure.message,
          ),
        ),
      ),
      (createdTask) {
        final updatedTasks = List<task.Task>.from(state.tasks)
          ..add(createdTask);
        emit(
          state.maybeWhen(
            orElse: () => TaskState(
              tasks: updatedTasks,
              isLoading: state.isLoading,
              errorMessage: null,
            ),
          ),
        );
        notificationService.scheduleTaskNotification(createdTask);
      },
    );
  }

  Future<void> removeTask(int id) async {
    final result = await deleteTask(id);
    result.fold(
      (failure) => emit(
        state.maybeWhen(
          orElse: () => TaskState(
            tasks: state.tasks,
            isLoading: state.isLoading,
            errorMessage: failure.message,
          ),
        ),
      ),
      (_) {
        final updatedTasks = state.tasks
            .where((task) => task.id != id)
            .toList();
        emit(
          state.maybeWhen(
            orElse: () => TaskState(
              tasks: updatedTasks,
              isLoading: state.isLoading,
              errorMessage: null,
            ),
          ),
        );
      },
    );
  }

  Future<void> completeTask(task.Task task) async {
    final result = await markTaskComplete(task);
    result.fold(
      (failure) => emit(
        state.maybeWhen(
          orElse: () => TaskState(
            tasks: state.tasks,
            isLoading: state.isLoading,
            errorMessage: failure.message,
          ),
        ),
      ),
      (_) {
        final updatedTasks = state.tasks.map((t) {
          if (t.id == task.id) {
            return task.copyWith(isCompleted: true);
          }
          return t;
        }).toList();
        emit(
          state.maybeWhen(
            orElse: () => TaskState(
              tasks: updatedTasks,
              isLoading: state.isLoading,
              errorMessage: null,
            ),
          ),
        );
      },
    );
  }

  Future<void> postponeTask(task.Task task) async {
    final result = await snoozeTask(task);
    result.fold(
      (failure) => emit(
        state.maybeWhen(
          orElse: () => TaskState(
            tasks: state.tasks,
            isLoading: state.isLoading,
            errorMessage: failure.message,
          ),
        ),
      ),
      (_) => fetchTasks(),
    );
  }

  Future<void> sortTaskList(bool ascending) async {
    final result = await sortTasks(SortParams(ascending));
    result.fold(
      (failure) => emit(
        state.maybeWhen(
          orElse: () => TaskState(
            tasks: state.tasks,
            isLoading: state.isLoading,
            errorMessage: failure.message,
          ),
        ),
      ),
      (sortedTasks) => emit(
        state.maybeWhen(
          orElse: () => TaskState(
            tasks: sortedTasks,
            isLoading: state.isLoading,
            errorMessage: null,
          ),
        ),
      ),
    );
  }

  Future<void> editTask(task.Task task) async {
    final result = await updateTask(task);
    result.fold(
      (failure) => emit(
        state.maybeWhen(
          orElse: () => TaskState(
            tasks: state.tasks,
            isLoading: state.isLoading,
            errorMessage: failure.message,
          ),
        ),
      ),
      (_) => fetchTasks(),
    );
  }
}
