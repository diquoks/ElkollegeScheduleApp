import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class CustomIconButton extends StatelessWidget {
  const new({super.key, required this._icon, required this._onPressed});

  final IconData _icon;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 32,
      padding: const .all(8),
      onPressed: _onPressed,
      icon: Icon(_icon, color: context.palette.contrastSecondary),
    );
  }
}
