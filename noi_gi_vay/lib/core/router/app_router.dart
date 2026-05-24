import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'route_constants.dart';

part 'app_router.g.dart';

/// Provider cho GoRouter — dùng @riverpod để generate
@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: RouteConstants.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: RouteConstants.home,
        name: 'home',
        builder: (context, state) =>
            const _PlaceholderScreen(title: 'Trang chủ'),
      ),
      GoRoute(
        path: RouteConstants.search,
        name: 'search',
        builder: (context, state) =>
            const _PlaceholderScreen(title: 'Tìm kiếm'),
      ),
      GoRoute(
        path: RouteConstants.detail,
        name: 'detail',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          return _PlaceholderScreen(title: 'Chi tiết — $id');
        },
      ),
      GoRoute(
        path: RouteConstants.favorites,
        name: 'favorites',
        builder: (context, state) =>
            const _PlaceholderScreen(title: 'Yêu thích'),
      ),
      GoRoute(
        path: RouteConstants.about,
        name: 'about',
        builder: (context, state) =>
            const _PlaceholderScreen(title: 'Giới thiệu'),
      ),
    ],
  );
}

/// Placeholder screen — sẽ được thay bằng màn hình thật ở Phase 3
class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
