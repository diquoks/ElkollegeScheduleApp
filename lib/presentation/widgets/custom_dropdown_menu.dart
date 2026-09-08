import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class CustomDropdownMenu<T> extends StatelessWidget {
  const new({super.key, required this._label});

  final String _label;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      expandedInsets: .zero,
      textStyle: context.styles.openSansRegular18_24.copyWith(
        color: context.palette.contrast,
      ),
      decorationBuilder: (_, MenuController? controller) {
        return .new(
          labelText: _label,
          suffixIcon: Padding(
            padding: const .all(4),
            child: (controller?.isOpen ?? false)
                ? CustomIconButton(
                    onPressed: () => controller?.close(),
                    icon: Icons.arrow_drop_up_rounded,
                  )
                : CustomIconButton(
                    onPressed: () => controller?.open.call(),
                    icon: Icons.arrow_drop_down_rounded,
                  ),
          ),
        );
      },
      dropdownMenuEntries: .empty(),
    ); // TODO
  }
}
