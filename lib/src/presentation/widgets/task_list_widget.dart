import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:taskify/core/const/colors.dart';
import 'package:taskify/src/domain/entites/task.dart';
import 'package:taskify/src/presentation/cubit/task_cubit.dart';
import 'package:taskify/src/presentation/cubit/task_state.dart';
import 'package:taskify/src/presentation/widgets/task_item.dart';

class TaskList extends StatelessWidget {
  final ScrollController scrollController;

  const TaskList({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    final TaskCubit taskCubit = GetIt.I<TaskCubit>();
    return BlocBuilder<TaskCubit, TaskState>(
      bloc: taskCubit,
      builder: (context, state) {
        final now = DateTime.now();
        final overdueTasks = state.tasks
            .where((t) => t.dueDate.isBefore(now))
            .toList();
        final upcomingTasks = state.tasks
            .where((t) => !t.dueDate.isBefore(now))
            .toList();
        return CustomScrollView(
          controller: scrollController,
          slivers: [
            if (state.isLoading)
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              )
            else if (state.errorMessage != null)
              SliverFillRemaining(child: _buildErrorState(state.errorMessage!))
            else if (state.tasks.isEmpty)
              SliverFillRemaining(child: _buildEmptyState())
            else ...[
              if (overdueTasks.isNotEmpty) _buildSectionHeader('Overdue Tasks'),
              _buildTaskList(overdueTasks),
              if (upcomingTasks.isNotEmpty)
                _buildSectionHeader('Upcoming Tasks'),
              _buildTaskList(upcomingTasks),
              const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
            ],
          ],
        );
      },
    );
  }

  Widget _buildSectionHeader(String title) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      sliver: SliverToBoxAdapter(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.onBackground.withValues(alpha: 0.7),
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }

  Widget _buildTaskList(List<Task> tasks) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final task = tasks[index];
        return Dismissible(
          key: Key(task.id.toString()),
          direction: DismissDirection.endToStart,
          background: Container(
            color: AppColors.error,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete_forever, color: Colors.white),
          ),
          confirmDismiss: (_) => _confirmDismiss(context),
          onDismissed: (_) {
            if (task.id != null) {
              GetIt.I<TaskCubit>().removeTask(task.id!);
            }
          },
          child: TaskItem(task: task),
        );
      }, childCount: tasks.length),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.assignment_outlined,
            size: 64,
            color: AppColors.onBackground.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 24),
          Text(
            'No tasks found!\nTap + to add a new task',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: AppColors.onBackground.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String errorMessage) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: AppColors.error),
          const SizedBox(height: 24),
          Text(
            'Error loading tasks',
            style: TextStyle(
              fontSize: 18,
              color: AppColors.onBackground.withValues(alpha: 0.8),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            errorMessage,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.onBackground.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            icon: const Icon(Icons.refresh),
            label: const Text('Try Again'),
            onPressed: () => GetIt.I<TaskCubit>().fetchTasks(),
          ),
        ],
      ),
    );
  }

  Future<bool> _confirmDismiss(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.error),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
