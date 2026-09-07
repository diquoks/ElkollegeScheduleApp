import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class HomePage extends ConsumerStatefulWidget {
  const new({super.key});

  static String get path => "/";

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: .end,
        spacing: 16,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _incrementCounter,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton.extended(
            onPressed: ref.read(themeServiceProvider.notifier).switchTheme,
            icon: Icon(ref.watch(themeServiceProvider).icon),
            label: const Text("switch theme"),
          ),
        ],
      ),
      backgroundColor: context.customTheme.palette.background,
      body: Center(
        child: Row(
          mainAxisAlignment: .center,
          spacing: 16,
          children: <Widget>[
            RichText(
              textAlign: .center,
              text: TextSpan(
                text: "score:\n",
                style: CustomStyles.openSansRegular14_18.copyWith(
                  color: context.customTheme.palette.contrastSecondary,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: "$_counter",
                    style: CustomStyles.openSansRegular24_28.copyWith(
                      color: context.customTheme.palette.contrast,
                    ),
                  ),
                ],
              ),
            ),
            RichText(
              textAlign: .center,
              text: TextSpan(
                text: "current theme:\n",
                style: CustomStyles.openSansRegular14_18.copyWith(
                  color: context.customTheme.palette.contrastSecondary,
                ),
                children: <InlineSpan>[
                  TextSpan(
                    text: ref.watch(themeServiceProvider).name,
                    style: CustomStyles.openSansRegular24_28.copyWith(
                      color: context.customTheme.palette.contrast,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
}

extension _ThemeModeIconX on ThemeMode {
  IconData get icon => switch (this) {
    .system => Icons.brightness_auto_rounded,
    .light => Icons.light_mode_rounded,
    .dark => Icons.dark_mode_rounded,
  };
}
