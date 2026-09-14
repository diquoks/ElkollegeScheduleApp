import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart";
import "package:material_ui/material_ui.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      overrides: <Override>[
        sharedPreferencesProvider.overrideWithValue(
          await .create(cacheOptions: .new(allowList: StorageManager.keys)),
        ),
      ],
      child: const Application(),
    ),
  );
}
