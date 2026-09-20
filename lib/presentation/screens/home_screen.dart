import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:go_router/go_router.dart";
import "package:material_ui/material_ui.dart";

class HomeScreen extends StatefulWidget {
  const new({super.key});

  static String get path => "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScheduleWidgetState> _scheduleWidgetKey = .new();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Расписание ЭК",
        actions: <Widget>[
          const CustomIconButton(
            icon: Icons.admin_panel_settings_rounded,
            onPressed: null, // TODO: open `AdminLoginScreen`
          ),
          CustomIconButton(
            icon: Icons.logo_dev_rounded,
            onPressed: () => context.go(TestScreen.path),
          ),
        ],
      ),
      body: CustomRefreshIndicator(
        onRefresh: () async =>
            await _scheduleWidgetKey.currentState?.refreshProviders(),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const .symmetric(vertical: 8, horizontal: 12),
          children: <Widget>[ScheduleWidget(key: _scheduleWidgetKey)],
        ),
      ),
    );
  }
}
