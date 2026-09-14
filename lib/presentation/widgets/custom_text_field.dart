import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:material_ui/material_ui.dart";

class CustomTextField extends StatelessWidget {
  const new({
    super.key,
    required this._controller,
    required this._label,
    required this._icon,
    this._readOnly = false,
    this._onPressed,
  });

  final TextEditingController _controller;
  final String _label;
  final IconData _icon;
  final bool _readOnly;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: context.styles.inputDecoration(
        labelText: _label,
        suffixIcon: CustomTextFieldIconButton(
          icon: _icon,
          forceCursor: true,
          onPressed: null,
        ),
      ),
      style: context.styles.openSansRegular18_24.copyWith(
        color: context.palette.contrast,
      ),
      readOnly: _readOnly,
      onSubmitted: !_readOnly || _onPressed == null
          ? null
          : (_) => _onPressed(),
      enableInteractiveSelection: !_readOnly,
      onTap: _onPressed,
      mouseCursor: !_readOnly || _onPressed == null
          ? null
          : SystemMouseCursors.click,
      magnifierConfiguration: .disabled,
    );
  }
}

class CustomTextFieldIconButton extends StatelessWidget {
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
    return MouseRegion(
      cursor: !_forceCursor ? .defer : SystemMouseCursors.click,
      opaque: false,
      child: Padding(
        padding: const .all(4),
        child: CustomIconButton(
          icon: _icon,
          forceCursor: _forceCursor,
          onPressed: _onPressed,
        ),
      ),
    );
  }
}
