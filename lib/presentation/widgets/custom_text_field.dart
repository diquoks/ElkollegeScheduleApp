import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class CustomTextField extends StatelessWidget {
  const new({
    super.key,
    required this._controller,
    required this._label,
    required this._icon,
  });

  final TextEditingController _controller;
  final String _label;
  final IconData _icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: .new(
        labelText: _label,
        suffixIcon: Padding(
          padding: const .all(4),
          child: CustomIconButton(
            onPressed: null, // TODO
            icon: _icon,
          ),
        ),
      ),
      style: context.styles.openSansRegular18_24.copyWith(
        color: context.palette.contrast,
      ),
    ); // TODO
  }
}
