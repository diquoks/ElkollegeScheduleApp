import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final NotifierProvider<ThemeService, ThemeMode> themeServiceProvider = .new(
  ThemeService.new,
);

class ThemeService extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    final StorageUseCase storageUseCase = ref.watch(storageUseCaseProvider);

    return storageUseCase.themeMode;
  }

  Future<void> switchTheme() async {
    final StorageUseCase storageUseCase = ref.read(storageUseCaseProvider);
    final int nextThemeIndex = state.index + 1;

    state = nextThemeIndex == ThemeMode.values.length
        ? .values.first
        : .values.elementAt(nextThemeIndex);

    await storageUseCase.setThemeMode(state);
  }
}
