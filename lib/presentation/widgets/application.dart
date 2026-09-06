import "package:elkollege_schedule_app/presentation/pages/home_page.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:go_router/go_router.dart";

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        routes: <RouteBase>[
          GoRoute(path: "/", builder: (_, _) => const HomePage()),
        ],
      ),
      title: "Расписание ЭК",
      theme: .from(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const <Locale>[Locale("ru", "RU")],
    );
  }
}
