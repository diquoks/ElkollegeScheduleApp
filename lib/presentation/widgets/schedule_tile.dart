import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class ScheduleTile extends StatelessWidget {
  const new({
    super.key,
    required this._number,
    required this._subject,
    required this._lecturer,
    required this._room,
    required this._onPressed,
  });

  final int? _number;
  final String? _subject;
  final String? _lecturer;
  final String? _room;
  final VoidCallback? _onPressed;

  @override
  Widget build(BuildContext context) {
    // TODO: switch to using models
    return InkWell(
      onTap: _onPressed,
      child: Container(
        padding: const .symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: context.styles.border(
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
        ),
        child: Row(
          spacing: 16,
          children: <Widget>[
            Text(
              "$_number",
              style: context.styles.openSansRegular24_28.copyWith(
                color: context.palette.contrast,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: <Widget>[
                  Text(
                    "$_subject",
                    style: context.styles.openSansRegular18_24.copyWith(
                      color: context.palette.contrast,
                    ),
                    overflow: .ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "$_lecturer",
                    style: context.styles.openSansRegular14_18.copyWith(
                      color: context.palette.contrastSecondary,
                    ),
                    overflow: .ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            Text(
              "$_room",
              style: context.styles.openSansRegular18_24.copyWith(
                color: context.palette.contrastSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
