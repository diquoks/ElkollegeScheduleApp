import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:material_ui/material_ui.dart";

class CustomTextField extends StatefulWidget {
  const new simple({
    super.key,
    required this._controller,
    required this._label,
    this._icon,
  }) : _obscured = false,
       _readOnly = false,
       _onPressed = null;

  const new obscured({
    super.key,
    required this._controller,
    required this._label,
  }) : _icon = null,
       _obscured = true,
       _readOnly = false,
       _onPressed = null;

  const new display({
    super.key,
    required this._controller,
    required this._label,
    required this._icon,
    required this._onPressed,
  }) : _obscured = false,
       _readOnly = true;

  final TextEditingController _controller;
  final String _label;
  final IconData? _icon;
  final bool _obscured;
  final bool _readOnly;
  final VoidCallback? _onPressed;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._controller,
      decoration: context.styles.inputDecoration(
        labelText: widget._label,
        suffixIcon: widget._obscured
            ? CustomTextFieldIconButton(
                icon: _obscureText
                    ? Icons.visibility_off_rounded
                    : Icons.visibility_rounded,
                onPressed: () => setState(() {
                  _obscureText = !_obscureText;
                }),
              )
            : widget._icon != null
            ? CustomTextFieldIconButton(
                icon: widget._icon!,
                onPressed: widget._onPressed,
              )
            : null,
      ),
      style: context.styles.openSansRegular18_24.copyWith(
        color: context.palette.contrast,
      ),
      readOnly: widget._readOnly,
      obscuringCharacter: "*",
      obscureText: widget._obscured && _obscureText,
      enableInteractiveSelection: !widget._readOnly,
      onTap: widget._onPressed,
      mouseCursor: widget._readOnly && widget._onPressed != null
          ? SystemMouseCursors.click
          : null,
      canRequestFocus: !widget._readOnly,
      magnifierConfiguration: .disabled,
    );
  }
}

class CustomTextFieldIconButton extends CustomIconButton {
  const new({super.key, required super.icon, required super.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(right: 4, top: 4, bottom: 4),
      child: super.build(context),
    );
  }
}
