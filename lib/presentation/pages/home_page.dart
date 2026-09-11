import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class HomePage extends ConsumerWidget {
  const new({super.key});

  static String get path => "/";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Расписание ЭК",
        actions: <Widget>[
          ThemeIconButton(),
          CustomIconButton(
            icon: Icons.admin_panel_settings_rounded,
            onPressed: null, // TODO: open `AdminLoginPage`
          ),
        ],
      ),
      backgroundColor: context.palette.background,
      body: const SingleChildScrollView(child: ScheduleWidget()),
    );
  }
}
