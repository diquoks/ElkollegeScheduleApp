import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:material_ui/material_ui.dart";

class HomePage extends StatefulWidget {
  const new({super.key});

  static String get path => "/";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScheduleWidgetState> _scheduleWidgetKey = .new();

  @override
  Widget build(BuildContext context) {
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
      body: CustomRefreshIndicator(
        onRefresh: () async =>
            await _scheduleWidgetKey.currentState?.refreshProvidersFuture,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: <Widget>[ScheduleWidget(key: _scheduleWidgetKey)],
        ),
      ),
    );
  }
}
