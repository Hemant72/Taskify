import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:taskify/core/di/dependency_injection.dart';
import 'package:taskify/core/services/notification_service.dart';
import 'package:taskify/core/theme/app_theme.dart';
import 'package:taskify/src/presentation/pages/home_page.dart';
import 'package:timezone/data/latest.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  config();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light(),
      debugShowCheckedModeBanner: false,
      navigatorKey: NotificationService.navigatorKey,
      home: HomePage(),
    );
  }
}

void config() async {
  configureDependencies();
  await GetIt.I.allReady();
  tz.initializeTimeZones();
  final notificationService = GetIt.I<NotificationService>();
  await notificationService.initialize().catchError((error) {
    debugPrint('Failed to initialize notifications: $error');
  });
}
