import "dart:math";

import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:intl/intl.dart";
import "package:material_ui/material_ui.dart";

class ScheduleWidget extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<ScheduleWidget> createState() => ScheduleWidgetState();
}

class ScheduleWidgetState extends ConsumerState<ScheduleWidget> {
  final TextEditingController _groupController = .new();
  final TextEditingController _dateController = .new();

  final ValueNotifier<DateTime> _selectedDate = .new(.now().crop());

  @override
  void initState() {
    _selectedDate.addListener(_reloadProviders);
    _selectedDate.addListener(_onSelectedDateChanged);
    _onSelectedDateChanged();

    super.initState();
  }

  @override
  void dispose() {
    _groupController.dispose();
    _dateController.dispose();

    _selectedDate.removeListener(_reloadProviders);
    _selectedDate.removeListener(_onSelectedDateChanged);
    _selectedDate.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String? selectedGroup = ref.watch(groupNameProvider);
    _groupController.text = selectedGroup ?? "";

    final AsyncValue<List<ScheduleRecordEntity>> scheduleRecords = ref.watch(
      scheduleRecordsProvider,
    );
    final AsyncValue<List<SubstitutionRecordEntity>> substitutionRecords = ref
        .watch(substitutionRecordsProvider(_selectedDate.value));

    return Column(
      spacing: 8,
      children: <Widget>[
        Row(
          spacing: 8,
          children: <Widget>[
            Expanded(
              child: CustomDropdownMenu<GroupScheduleEntity>(
                controller: _groupController,
                label: "Группа",
                initialSelection: scheduleRecords.value?.groupSchedules
                    .getByGroupName(selectedGroup),
                onSelected: (GroupScheduleEntity? e) async {
                  if (e == null) {
                    return;
                  }

                  await ref
                      .read(groupNameProvider.notifier)
                      .setGroupName(e.groupName);
                },
                items:
                    scheduleRecords.value?.groupSchedules ??
                    const <GroupScheduleEntity>[],
                labelBuilder: (GroupScheduleEntity e) => e.groupName,
              ),
            ),
            Expanded(
              child: CustomTextField.display(
                controller: _dateController,
                label: "Дата",
                icon: Icons.date_range_rounded,
                onPressed: _showDatePicker,
              ),
            ),
          ],
        ),
        Material(
          type: .transparency,
          shape: context.styles.shapeBorder(
            borderColor: context.palette.border,
          ),
          clipBehavior: .antiAlias,
          child: _buildScheduleChild(
            context,
            scheduleRecords,
            substitutionRecords,
          ),
        ),
      ],
    );
  }

  Widget _buildScheduleChild(
    BuildContext context,
    AsyncValue<List<ScheduleRecordEntity>> scheduleRecords,
    AsyncValue<List<SubstitutionRecordEntity>> substitutionRecords,
  ) {
    Text errorText(String data) => Text(
      data,
      style: context.styles.openSansRegular24_28.copyWith(
        color: context.palette.contrast,
      ),
      textAlign: .center,
    );

    bool wrapWithContainer = true;
    Widget mainChild;
    Widget? infoChild;

    switch ((scheduleRecords, substitutionRecords)) {
      case (
        AsyncValue<List<ScheduleRecordEntity>>(
          value: final List<ScheduleRecordEntity> scheduleRecordsValue,
          isReloading: false,
        ),
        AsyncValue<List<SubstitutionRecordEntity>>(
          value: final List<SubstitutionRecordEntity> substitutionRecordsValue,
          isReloading: false,
        ),
      ):
        if (scheduleRecordsValue.isEmpty) {
          continue emptySchedule;
        }

        final String? selectedGroup = ref.watch(groupNameProvider);
        final GroupScheduleEntity? selectedGroupSchedule = scheduleRecordsValue
            .groupSchedules
            .getByGroupName(selectedGroup);
        final List<SubstitutionEntity> selectedSubstitutions =
            substitutionRecordsValue.substitutions.getWithSameGroupName(
              selectedGroup,
            );

        if (selectedGroup == null || selectedGroupSchedule == null) {
          _groupController.clear();
          mainChild = errorText("Выберите группу для\nпросмотра расписания!");
          break;
        }

        const String infoDateFormat = "dd.MM.yy в HH:mm";

        String scheduleInfo;
        try {
          final ScheduleRecordEntity usedRecord = scheduleRecordsValue
              .singleWhere(
                (ScheduleRecordEntity e) =>
                    e.json.contains(selectedGroupSchedule),
                orElse: () => throw const FormatException(),
              );

          scheduleInfo =
              "обновлено ${DateFormat(infoDateFormat).format(usedRecord.updated.toLocal())}";
        } on FormatException {
          scheduleInfo = "отсутствует";
        }

        String substitutionsInfo;
        try {
          final SubstitutionRecordEntity usedRecord = substitutionRecordsValue
              .singleWhere(
                (SubstitutionRecordEntity e) =>
                    selectedSubstitutions.every(e.json.contains),
                orElse: () => throw const FormatException(),
              );

          substitutionsInfo =
              "обновлены ${DateFormat(infoDateFormat).format(usedRecord.updated.toLocal())}";
        } on FormatException {
          substitutionsInfo = "отсутствуют";
        }

        infoChild = CustomTile(
          height: 60,
          child: Row(
            spacing: 16,
            children: <Widget>[
              const Icon(Icons.info_rounded),
              Text(
                "Расписание: $scheduleInfo\nЗамены: $substitutionsInfo",
                style: context.styles.openSansRegular14_18.copyWith(
                  color: context.palette.contrastSecondary,
                ),
              ),
            ],
          ),
        );

        final List<PeriodEntity> selectedPeriods =
            selectedGroupSchedule.daySchedules
                .getByWeekday(_selectedDate.value.weekday)
                ?.periods ??
            const <PeriodEntity>[];

        if (selectedPeriods.isEmpty && selectedSubstitutions.isEmpty) {
          mainChild = errorText("Пары отсутствуют!");
          break;
        }

        wrapWithContainer = false;
        mainChild = Column(
          children: _buildScheduleColumnChildren(
            selectedPeriods,
            selectedSubstitutions,
          ).toList(),
        );

      emptySchedule:
      case (AsyncError<List<GroupScheduleEntity>>(), _):
      case (_, AsyncError<List<SubstitutionEntity>>()):
        mainChild = errorText("Расписание отсутствует!");

      default:
        mainChild = const CircularProgressIndicator();
    }

    return Column(
      children: <Widget>[
        if (wrapWithContainer)
          Container(
            padding: const .all(16),
            constraints: const .new(minHeight: 180),
            child: Center(child: mainChild),
          )
        else
          mainChild,
        ?infoChild,
      ],
    );
  }

  Iterable<Widget> _buildScheduleColumnChildren(
    List<PeriodEntity> periods,
    List<SubstitutionEntity> substitutions,
  ) sync* {
    final List<PeriodEntity> periodsWithAppliedSubstitutions = periods
        .applySubstitutions(substitutions);

    final List<int> periodsNumbers = periodsWithAppliedSubstitutions
        .map((PeriodEntity e) => e.number)
        .toList();
    for (
      int periodNumber = periodsNumbers.reduce(min);
      periodNumber <= periodsNumbers.reduce(max);
      ++periodNumber
    ) {
      final List<PeriodEntity> periodsWithSameNumber =
          periodsWithAppliedSubstitutions.getWithSameNumber(periodNumber);

      switch (periodsWithSameNumber.length) {
        case 0:
          break;
        case 1:
          final PeriodEntity singlePeriod = periodsWithSameNumber.single;

          if (singlePeriod.subgroup != null) {
            continue hasSubgroup;
          }

          yield ScheduleTile(period: singlePeriod);
        hasSubgroup:
        default:
          yield Row(
            children: _buildScheduleRowChildren(periodsWithSameNumber).toList(),
          );
      }
    }
  }

  Iterable<Widget> _buildScheduleRowChildren(List<PeriodEntity> periods) sync* {
    for (int periodSubgroup = 1; periodSubgroup <= 2; ++periodSubgroup) {
      final PeriodEntity? periodWithMatchingSubgroup = periods.getBySubgroup(
        periodSubgroup,
      );

      yield Expanded(child: ScheduleTile(period: periodWithMatchingSubgroup));
    }
  }

  void _onSelectedDateChanged() =>
      _dateController.text = DateFormat("dd.MM.yy").format(_selectedDate.value);

  Future<void> _showDatePicker() async {
    final DateTime currentDate = .now().crop();

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate.value,
      firstDate: const .fromEnvironment("DEBUG_DATE_PICKER")
          ? currentDate.copyWith(year: currentDate.year - 2)
          : currentDate.subtract(const .new(days: 7)),
      lastDate: currentDate.add(const .new(days: 6)),
      currentDate: currentDate,
      initialEntryMode: .calendarOnly,
      builder: (BuildContext context, Widget? child) {
        final ThemeData theme = Theme.of(context);

        return Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              primary: context.palette.contrast,
              onSurface: context.palette.contrastSecondary,
              onSurfaceVariant: context.palette.contrast,
              outlineVariant: context.palette.border,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate == null) {
      return;
    }

    _selectedDate.value = selectedDate;
  }

  void _reloadProviders() => ref
    ..invalidate(scheduleRecordsProvider, asReload: true)
    ..invalidate(
      substitutionRecordsProvider(_selectedDate.value),
      asReload: true,
    );

  Future<void> refreshProviders() => .wait(<Future<void>>[
    ref.refresh(scheduleRecordsProvider.future),
    ref.refresh(substitutionRecordsProvider(_selectedDate.value).future),
  ]);
}
