import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_it/get_it.dart';
import 'package:path_provider/path_provider.dart';
import 'package:taskify/core/services/notification_service.dart';
import 'package:taskify/src/data/datasource/local_datasource.dart';
import 'package:taskify/src/data/datasource/task_local_datasource.dart';
import 'package:taskify/src/data/repositiory/task_repository_impl.dart';
import 'package:taskify/src/domain/repositiory/task_repository.dart';
import 'package:taskify/src/domain/usecases/create_task.dart';
import 'package:taskify/src/domain/usecases/delete_task.dart';
import 'package:taskify/src/domain/usecases/get_task.dart';
import 'package:taskify/src/domain/usecases/get_task_by_id.dart';
import 'package:taskify/src/domain/usecases/mark_task_complete.dart';
import 'package:taskify/src/domain/usecases/snooze_task.dart';
import 'package:taskify/src/domain/usecases/sort_task.dart';
import 'package:taskify/src/domain/usecases/update_task.dart';
import 'package:taskify/src/presentation/cubit/task_cubit.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerSingleton<FlutterLocalNotificationsPlugin>(
    FlutterLocalNotificationsPlugin(),
  );

  getIt.registerLazySingleton<AppDatabase>(() {
    try {
      return AppDatabase(
        LazyDatabase(() async {
          final dbFolder = await getApplicationDocumentsDirectory();
          return NativeDatabase(File('${dbFolder.path}/db.sqlite'));
        }),
      );
    } catch (e) {
      debugPrint('DB init error: $e');
      rethrow;
    }
  });

  getIt.registerLazySingleton<TaskLocalDataSource>(
    () => TaskLocalDataSourceImpl(getIt()),
  );
  getIt.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(localDataSource: getIt()),
  );

  getIt.registerLazySingleton(() => CreateTask(getIt()));
  getIt.registerLazySingleton(() => DeleteTask(getIt()));
  getIt.registerLazySingleton(() => GetTasks(getIt()));
  getIt.registerLazySingleton(() => GetTaskById(getIt()));
  getIt.registerLazySingleton(() => MarkTaskComplete(getIt()));
  getIt.registerLazySingleton(() => SnoozeTask(getIt()));
  getIt.registerLazySingleton(() => SortTasks(getIt()));
  getIt.registerLazySingleton(() => UpdateTask(getIt()));

  getIt.registerLazySingleton<NotificationService>(
    () => NotificationService(getIt()),
  );

  getIt.registerSingleton<TaskCubit>(
    TaskCubit(
      notificationService: getIt(),
      createTask: getIt(),
      deleteTask: getIt(),
      getTasks: getIt(),
      getTaskById: getIt(),
      markTaskComplete: getIt(),
      snoozeTask: getIt(),
      sortTasks: getIt(),
      updateTask: getIt(),
    ),
  );
}
