import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_ui/material_ui.dart";

final NotifierProvider<ThemeModeNotifier, ThemeMode> themeModeProvider = .new(
  ThemeModeNotifier.new,
);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final StorageUseCase storageUseCase = ref.watch(storageUseCaseProvider);

    return storageUseCase.themeMode;
  }

  Future<void> switchTheme() async {
    final int nextThemeIndex = state.index + 1;
    state = nextThemeIndex < ThemeMode.values.length
        ? .values.elementAt(nextThemeIndex)
        : .values.first;

    await ref.read(storageUseCaseProvider).setThemeMode(state);
  }
}
