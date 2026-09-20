import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/foundation.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:material_ui/material_ui.dart";
import "package:web/web.dart" as web;

class Application extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: "Расписание ЭК",
      theme: CustomPalette.themeFromBrightness(.light),
      darkTheme: CustomPalette.themeFromBrightness(.dark),
      themeMode: ref.watch(themeModeProvider),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const <Locale>[.new("ru", "RU")],
      builder: (BuildContext context, Widget? child) {
        if (kIsWeb) {
          _setDocumentBackgroundColor(context.palette.background);
        }

        return child!;
      },
    );
  }

  void _setDocumentBackgroundColor(Color color) {
    final String colorString = color
        .toARGB32()
        .toRadixString(16)
        .substring(2, 8);

    (web.document.documentElement as web.HTMLElement?)?.style.backgroundColor =
        "#$colorString";
  }
}
