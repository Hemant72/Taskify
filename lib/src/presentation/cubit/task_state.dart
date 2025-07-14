part of 'task_cubit.dart';

@freezed
class TaskState with _$TaskState {
  const factory TaskState.initial() = _Initial;

  const factory TaskState({
    @Default([]) List<task.Task> tasks,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _TaskState;
}
