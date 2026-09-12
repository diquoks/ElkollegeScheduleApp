import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";

class ScheduleTile extends StatelessWidget {
  const new({super.key, required this._period, required this._onPressed});

  final PeriodEntity? _period;
  final void Function(PeriodEntity)? _onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _period == null ? null : () => _onPressed?.call(_period),
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
              "${_period?.number}",
              style: context.styles.openSansRegular24_28.copyWith(
                color: context.palette.contrast,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                children: <Widget>[
                  Text(
                    "${_period?.subject}",
                    style: context.styles.openSansRegular18_24.copyWith(
                      color: context.palette.contrast,
                    ),
                    overflow: .ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    "${_period?.lecturer}",
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
              "${_period?.room}",
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
