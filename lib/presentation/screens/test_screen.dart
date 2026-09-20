import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:go_router/go_router.dart";
import "package:material_ui/material_ui.dart";

class TestScreen extends StatefulWidget {
  const new({super.key});

  static String get path => "/test";

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController _emailController = .new();
  final TextEditingController _passwordController = .new();

  final ValueNotifier<String> _widgetText = .new("empty");

  @override
  void initState() {
    _emailController.addListener(_updateWidgetText);
    _passwordController.addListener(_updateWidgetText);

    super.initState();
  }

  @override
  void dispose() {
    _emailController.removeListener(_updateWidgetText);
    _emailController.dispose();
    _passwordController.removeListener(_updateWidgetText);
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "TestScreen",
        actions: <Widget>[
          CustomIconButton(
            icon: Icons.home_rounded,
            onPressed: () => context.go(HomeScreen.path),
          ),
        ],
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const .symmetric(vertical: 8, horizontal: 12),
        children: <Widget>[
          Column(
            spacing: 8,
            children: <Widget>[
              CustomTextField.simple(
                controller: _emailController,
                label: "Email",
                icon: Icons.email_rounded,
              ),
              CustomTextField.obscured(
                controller: _passwordController,
                label: "Пароль",
              ),
              Row(
                children: <Widget>[
                  Text(
                    _widgetText.value,
                    style: context.styles.openSansRegular18_24.copyWith(
                      color: context.palette.contrast,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updateWidgetText() => setState(() {
    _widgetText.value =
        "email: ${_emailController.text}\npassword: ${_passwordController.text}";
  });
}
