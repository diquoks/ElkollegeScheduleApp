import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ThemeIconButton extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomIconButton(
      onPressed: ref.read(themeServiceProvider.notifier).switchTheme,
      icon: ref.watch(themeServiceProvider).icon,
    );
  }
}

extension _ThemeModeIconX on ThemeMode {
  IconData get icon => switch (this) {
    .system => Icons.brightness_auto_rounded,
    .light => Icons.light_mode_rounded,
    .dark => Icons.dark_mode_rounded,
  };
}
