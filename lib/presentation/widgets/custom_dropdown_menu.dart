import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class CustomDropdownMenu<T> extends StatelessWidget {
  const new({
    super.key,
    required this._controller,
    required this._label,
    required this._entries,
  });

  final TextEditingController _controller;
  final String _label;
  final List<DropdownMenuEntry<T>> _entries;

  @override
  Widget build(BuildContext context) {
    // TODO: add new parameters to configure more flexibly
    return DropdownMenu<T>(
      enabled: _entries.isNotEmpty,
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
                    icon: Icons.arrow_drop_up_rounded,
                    onPressed: () => controller?.close(),
                  )
                : CustomIconButton(
                    icon: Icons.arrow_drop_down_rounded,
                    onPressed: () => controller?.open(),
                  ),
          ),
        );
      },
      controller: _controller,
      expandedInsets: .zero,
      alignmentOffset: const .new(0, 8),
      dropdownMenuEntries: _entries,
    );
  }
}
