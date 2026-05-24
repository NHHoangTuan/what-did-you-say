import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/constants/app_constants.dart';
import 'core/constants/hive_constants.dart';
import 'core/theme/app_theme.dart';
import 'core/router/app_router.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Giữ splash screen trong khi khởi tạo
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Khởi tạo Hive
  await Hive.initFlutter();
  await Hive.openBox<String>(HiveConstants.favoritesBox);
  await Hive.openBox<String>(HiveConstants.recentSearchesBox);
  await Hive.openBox<String>(HiveConstants.slangOfDayBox);

  runApp(
    const ProviderScope(
      child: NoiGiVayApp(),
    ),
  );

  // Xóa splash khi app đã ready
  FlutterNativeSplash.remove();
}

class NoiGiVayApp extends ConsumerWidget {
  const NoiGiVayApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: router,
    );
  }
}
