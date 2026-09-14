import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_ui/material_ui.dart";

final Provider<StorageUseCase> storageUseCaseProvider = .new(
  (Ref ref) => .new(storageManager: ref.watch(storageManagerProvider)),
);

class const StorageUseCase({required final StorageManager _storageManager}) {
  ThemeMode get themeMode {
    final int? value = _storageManager.themeMode;

    if (value == null) {
      return .system;
    }

    return .values.elementAtOrNull(value) ?? .system;
  }

  Future<void> setThemeMode(ThemeMode value) =>
      _storageManager.setThemeMode(value.index);

  String? get groupName => _storageManager.groupName;

  Future<void> setGroupName(String value) =>
      _storageManager.setGroupName(value);
}
