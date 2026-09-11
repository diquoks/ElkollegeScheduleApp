import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class CustomTextField extends StatelessWidget {
  const new({
    super.key,
    required this._controller,
    required this._label,
    required this._icon,
    required this._onPressed,
  });

  final TextEditingController _controller;
  final String _label;
  final IconData _icon;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: add new parameters to configure more flexibly
    return TextField(
      controller: _controller,
      decoration: .new(
        labelText: _label,
        suffixIcon: Padding(
          padding: const .all(4),
          child: CustomIconButton(icon: _icon, onPressed: _onPressed),
        ),
      ),
      style: context.styles.openSansRegular18_24.copyWith(
        color: context.palette.contrast,
      ),
    );
  }
}
