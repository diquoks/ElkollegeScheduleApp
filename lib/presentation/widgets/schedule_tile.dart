import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:material_ui/material_ui.dart";

class ScheduleTile extends StatelessWidget {
  const new({super.key, required this._period});

  final PeriodEntity? _period;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _period != null ? () => _showInfoDialog(context) : null,
      child: CustomTile(
        child: Visibility.maintain(
          visible: _period != null,
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
      ),
    );
  }

  void _showInfoDialog(BuildContext context) => showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          <String>[
            "${_period!.number}.",
            if (_period.subgroup != null) "(${_period.subgroup})",
            _period.subject,
          ].join(" "),
          style: context.styles.openSansRegular24_28.copyWith(
            color: context.palette.contrast,
          ),
        ),
        content: Text(
          "${_period.lecturer} | ${_period.room}",
          style: context.styles.openSansRegular18_24.copyWith(
            color: context.palette.contrastSecondary,
          ),
        ),
      );
    },
  );
}
