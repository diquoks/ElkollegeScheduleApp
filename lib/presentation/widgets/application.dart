import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:web/web.dart" as web;

class Application extends ConsumerWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      title: "Расписание ЭК",
      theme: _getCustomThemeData(.light()),
      darkTheme: _getCustomThemeData(.dark()),
      themeMode: ref.watch(themeServiceProvider),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const <Locale>[.new("ru", "RU")],
      builder: (BuildContext context, Widget? child) {
        final String colorString = context.customTheme.palette.background
            .toARGB32()
            .toRadixString(16)
            .substring(2, 8);

        (web.document.documentElement as web.HTMLElement?)
                ?.style
                .backgroundColor =
            "#$colorString";

        return child!;
      },
    );
  }

  ThemeData _getCustomThemeData(ThemeData themeData) => themeData.copyWith(
    extensions: <ThemeExtension<dynamic>>[
      CustomTheme(
        palette: switch (themeData.brightness) {
          .light => const .light(),
          .dark => const .dark(),
        },
      ),
    ],
  );
}
