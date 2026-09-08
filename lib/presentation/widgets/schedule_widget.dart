import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ScheduleWidget extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends ConsumerState<ScheduleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(vertical: 8, horizontal: 12),
      child: Column(
        spacing: 8,
        children: <Widget>[
          Row(
            spacing: 8,
            children: <Widget>[
              const Expanded(
                child: CustomDropdownMenu<dynamic>(label: "Группа"),
              ),
              Expanded(
                child: CustomTextField(
                  controller: .new(),
                  label: "Дата",
                  icon: Icons.date_range_rounded,
                ),
              ),
            ],
          ),
          Placeholder(color: context.palette.border),
        ],
      ),
    ); // TODO
  }
}
