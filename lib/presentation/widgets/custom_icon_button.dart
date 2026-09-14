import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:material_ui/material_ui.dart";

class CustomIconButton extends StatelessWidget {
  const new({
    super.key,
    required this._icon,
    this._forceCursor = false,
    required this._onPressed,
  });

  final IconData _icon;
  final bool _forceCursor;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 32,
      padding: const .all(8),
      onPressed: _onPressed,
      mouseCursor: !_forceCursor ? null : SystemMouseCursors.click,
      icon: Icon(_icon, color: context.palette.contrastSecondary),
    );
  }
}
