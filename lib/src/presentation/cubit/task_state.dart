import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taskify/src/domain/entites/task.dart' as task;

part 'task_state.freezed.dart';

@freezed
abstract class TaskState with _$TaskState {
  const factory TaskState({
    @Default([]) List<task.Task> tasks,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _TaskState;
}
