import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:shared_preferences/shared_preferences.dart";

final Provider<SharedPreferencesWithCache> sharedPreferencesProvider = .new(
  (_) =>
      throw StateError("This provider should be overridden in async context!"),
);
