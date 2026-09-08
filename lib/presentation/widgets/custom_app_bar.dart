import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const new({super.key, required this._title, required this._actions});

  final String _title;
  final List<Widget> _actions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const .only(left: 24, right: 16, top: 8, bottom: 8),
      color: context.palette.background,
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: <Widget>[
          Text(
            _title,
            style: context.styles.openSansRegular24_28.copyWith(
              color: context.palette.contrast,
            ),
          ),
          Row(spacing: 8, children: _actions),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const .fromHeight(64);
}
