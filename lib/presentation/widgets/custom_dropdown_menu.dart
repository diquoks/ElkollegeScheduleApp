import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:material_ui/material_ui.dart";

class CustomDropdownMenu<T> extends StatelessWidget {
  const new({
    super.key,
    required this._controller,
    required this._label,
    this._initialSelection,
    this._onSelected,
    required this._items,
    required this._labelBuilder,
  });

  final TextEditingController _controller;
  final String _label;
  final T? _initialSelection;
  final void Function(T?)? _onSelected;
  final List<T> _items;
  final String Function(T) _labelBuilder;

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      enabled: _items.isNotEmpty,
      textStyle: context.styles.openSansRegular18_24.copyWith(
        color: context.palette.contrast,
      ),
      decorationBuilder: (_, MenuController? controller) =>
          context.styles.inputDecoration(
            labelText: _label,
            suffixIcon: controller?.isOpen ?? false
                ? CustomTextFieldIconButton(
                    icon: Icons.arrow_drop_up_rounded,
                    onPressed: controller?.close,
                  )
                : CustomTextFieldIconButton(
                    icon: Icons.arrow_drop_down_rounded,
                    onPressed: controller?.open,
                  ),
          ),
      menuStyle: .new(
        backgroundColor: .all(context.palette.background),
        padding: .all(.zero),
        maximumSize: .all(const .fromHeight(256)),
        shape: .all(
          context.styles.shapeBorder(borderColor: context.palette.border),
        ),
        visualDensity: .compact,
      ),
      controller: _controller,
      initialSelection: _initialSelection,
      onSelected: _onSelected,
      requestFocusOnTap: true,
      expandedInsets: .zero,
      alignmentOffset: const .new(0, 8),
      dropdownMenuEntries: _items
          .map((T item) => _buildMenuEntry(context, item))
          .toList(),
    );
  }

  DropdownMenuEntry<T> _buildMenuEntry(BuildContext context, T item) => .new(
    value: item,
    label: _labelBuilder(item),
    labelWidget: Text(
      _labelBuilder(item),
      style: context.styles.openSansRegular18_24.copyWith(
        color: context.palette.contrast,
      ),
    ),
    style: MenuItemButton.styleFrom(padding: const .all(24), side: .none),
  );
}
