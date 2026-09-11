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
    // TODO: add logic
    return Padding(
      padding: const .symmetric(vertical: 8, horizontal: 12),
      child: Column(
        spacing: 8,
        children: <Widget>[
          Row(
            spacing: 8,
            children: <Widget>[
              Expanded(
                child: CustomDropdownMenu<dynamic>(
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
            child: const Column(
              children: <Widget>[
                ScheduleTile(
                  number: 0,
                  subject: "Классный час",
                  lecturer: "Ульянов И.М.",
                  room: "45",
                  onPressed: null,
                ),
                ScheduleTile(
                  number: 1,
                  subject: "Компьютерные сети",
                  lecturer: "Ульянов И.М.",
                  room: "45",
                  onPressed: null,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ScheduleTile(
                        number: 2,
                        subject: "Иностр. яз.",
                        lecturer: "Самышина Л.А.",
                        room: "1",
                        onPressed: null,
                      ),
                    ),
                    Expanded(
                      child: ScheduleTile(
                        number: 2,
                        subject: "Иностр. яз.",
                        lecturer: "Иваниенко М.С.",
                        room: "21",
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
                ScheduleTile(
                  number: 3,
                  subject: "Безопасность компьютерных сетей",
                  lecturer: "Хренков К.А.",
                  room: "45",
                  onPressed: null,
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    Expanded(
                      child: ScheduleTile(
                        number: 4,
                        subject: "ИТ",
                        lecturer: "Алферова Ж.О.",
                        room: "12",
                        onPressed: null,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ScheduleTile(
                        number: 5,
                        subject: "ДИ",
                        lecturer: "Алферова Ж.О.",
                        room: "24",
                        onPressed: null,
                      ),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
                ScheduleTile(
                  number: 6,
                  subject: "Физическая культура",
                  lecturer: "Блохина Л.А.",
                  room: "СЗ2",
                  onPressed: null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
