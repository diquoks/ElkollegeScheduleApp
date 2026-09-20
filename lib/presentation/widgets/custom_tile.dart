import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:material_ui/material_ui.dart";

class CustomTile extends StatelessWidget {
  const new({super.key, this._height, required this._child});

  final double? _height;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        border: context.styles.boxBorder(
          borderColor: context.palette.border,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
      ),
      height: _height,
      child: _child,
    );
  }
}
