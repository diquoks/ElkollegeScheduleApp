import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:material_ui/material_ui.dart";

final Provider<GoRouter> routerProvider = .new(
  (_) => .new(
    routes: <GoRoute>[
      .new(
        path: HomeScreen.path,
        pageBuilder: (_, _) => _wrapWithPage(const HomeScreen()),
      ),
      .new(
        path: TestScreen.path,
        pageBuilder: (_, _) => _wrapWithPage(const TestScreen()),
      ),
    ],
    redirect: (_, GoRouterState state) {
      if (state.error != null) {
        return HomeScreen.path;
      }

      return null;
    },
    initialLocation: HomeScreen.path,
  ),
);

Page<void> _wrapWithPage(Widget child) => NoTransitionPage<void>(child: child);
