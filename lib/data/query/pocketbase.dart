import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pocketbase/pocketbase.dart";

final Provider<PocketBase> pocketbaseProvider = .new(
  (_) => .new(const .fromEnvironment("POCKETBASE_BASE_URL")),
);
