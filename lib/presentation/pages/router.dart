import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

final Provider<GoRouter> routerProvider = .new(
  (_) => .new(
    routes: <GoRoute>[
      .new(path: HomePage.path, builder: (_, _) => const HomePage()),
    ],
  ),
);
