import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";

final Provider<StorageManager> storageManagerProvider = .new(
  (Ref ref) => .new(sharedPreferences: ref.watch(sharedPreferencesProvider)),
);

class const StorageManager({
  required final SharedPreferencesWithCache _sharedPreferences,
}) {
  static const String _keyThemeMode = "themeMode";
  static const String _keyGroupName = "groupName";

  static Set<String> get keys => <String>{_keyThemeMode, _keyGroupName};

  int? get themeMode => _sharedPreferences.getInt(_keyThemeMode);

  Future<void> setThemeMode(int value) =>
      _sharedPreferences.setInt(_keyThemeMode, value);

  String? get groupName => _sharedPreferences.getString(_keyGroupName);

  Future<void> setGroupName(String value) =>
      _sharedPreferences.setString(_keyGroupName, value);
}
