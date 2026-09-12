import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class ScheduleWidget extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends ConsumerState<ScheduleWidget> {
  final TextEditingController _groupController = .new();
  final TextEditingController _dateController = .new();

  @override
  void dispose() {
    _groupController.dispose();
    _dateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<GroupScheduleEntity>> schedules = ref.watch(
      schedulesProvider,
    );
    // TODO: add substitutions

    return Padding(
      padding: const .symmetric(vertical: 8, horizontal: 12),
      child: Column(
        spacing: 8,
        children: <Widget>[
          Row(
            spacing: 8,
            children: <Widget>[
              Expanded(
                child: CustomDropdownMenu<GroupScheduleEntity>(
                  controller: _groupController,
                  label: "Группа",
                  entries: .empty(),
                ),
              ),
              Expanded(
                child: CustomTextField(
                  controller: _dateController,
                  label: "Дата",
                  onPressed: null,
                  icon: Icons.date_range_rounded,
                ),
              ),
            ],
          ),
          Material(
            type: .transparency,
            shape: context.styles.roundedRectangleBorder(),
            clipBehavior: .antiAliasWithSaveLayer,
            child: _buildScheduleChild(context, schedules),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleChild(
    BuildContext context,
    AsyncValue<List<GroupScheduleEntity>> schedules,
  ) {
    Widget centeredWidget;

    switch (schedules) {
      case AsyncValue<List<GroupScheduleEntity>>(
        :final List<GroupScheduleEntity> value,
      ):
        if (value.isEmpty) continue emptySchedule;

        throw UnimplementedError(); // TODO
      emptySchedule:
      case AsyncValue<List<GroupScheduleEntity>>(hasError: true):
        centeredWidget = Text(
          "Пары отсутствуют!", // TODO
          style: context.styles.openSansRegular24_28.copyWith(
            color: context.palette.contrast,
          ),
          textAlign: .center,
        );
        break;
      default:
        centeredWidget = const CircularProgressIndicator();
        break;
    }

    return Container(
      padding: const .all(16),
      constraints: const .new(minHeight: 174),
      child: Center(child: centeredWidget),
    );
  }
}
