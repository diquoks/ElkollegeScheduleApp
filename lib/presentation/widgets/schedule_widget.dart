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

  final ValueNotifier<DateTime> _selectedDate = .new(.now().asCropped());

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
    final String? selectedGroup = ref.watch(groupServiceProvider);
    _groupController.text = selectedGroup ?? "";

    final AsyncValue<List<GroupScheduleEntity>> schedules = ref.watch(
      schedulesProvider,
    );
    final AsyncValue<List<SubstitutionEntity>> substitutions = ref.watch(
      substitutionsProvider(_selectedDate.value),
    );

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
                  initialSelection: schedules.value?.getByGroupName(
                    selectedGroup,
                  ),
                  onSelected: (GroupScheduleEntity? e) async {
                    if (e == null) {
                      return;
                    }

                    await ref
                        .read(groupServiceProvider.notifier)
                        .setGroupName(e.groupName);
                  },
                  items: schedules.value ?? const <GroupScheduleEntity>[],
                  labelBuilder: (GroupScheduleEntity e) => e.groupName,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  controller: _dateController,
                  label: "Дата",
                  icon: Icons.date_range_rounded,
                  readOnly: true,
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
            child: _buildScheduleChild(context, schedules, substitutions),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleChild(
    BuildContext context,
    AsyncValue<List<GroupScheduleEntity>> schedules,
    AsyncValue<List<SubstitutionEntity>> substitutions,
  ) {
    Text errorText(String data) => Text(
      data,
      style: context.styles.openSansRegular24_28.copyWith(
        color: context.palette.contrast,
      ),
      textAlign: .center,
    );

    Widget centerChild;

    switch ((schedules, substitutions)) {
      case (
        AsyncValue<List<GroupScheduleEntity>>(
          value: final List<GroupScheduleEntity> schedulesValue,
          isReloading: false,
        ),
        AsyncValue<List<SubstitutionEntity>>(
          value: final List<SubstitutionEntity> substitutionsValue,
          isReloading: false,
        ),
      ):
        if (schedulesValue.isEmpty) {
          continue emptySchedule;
        }

        final String? selectedGroup = ref.watch(groupServiceProvider);
        final GroupScheduleEntity? selectedGroupSchedule = schedulesValue
            .getByGroupName(selectedGroup);
        final List<SubstitutionEntity> selectedGroupSubstitutions =
            substitutionsValue.getWithSameGroupName(selectedGroup);

        if (selectedGroup == null || selectedGroupSchedule == null) {
          _groupController.clear();
          centerChild = errorText("Выберите группу для\nпросмотра расписания!");
          break;
        }

        final List<PeriodEntity> periods =
            selectedGroupSchedule.daySchedules
                .getByWeekday(_selectedDate.value.weekday)
                ?.periods ??
            const <PeriodEntity>[];

        if (periods.isEmpty && selectedGroupSubstitutions.isEmpty) {
          centerChild = errorText("Пары отсутствуют!");
          break;
        }

        return Column(
          children: _buildScheduleColumnChildren(
            periods,
            selectedGroupSubstitutions,
          ).toList(),
        );
      emptySchedule:
      case (AsyncError<List<GroupScheduleEntity>>(), _):
      case (_, AsyncError<List<SubstitutionEntity>>()):
        centerChild = errorText("Расписание отсутствует!");

      default:
        centerChild = const CircularProgressIndicator();
    }

    return Container(
      padding: const .all(16),
      constraints: const .new(minHeight: 180),
      child: Center(child: centerChild),
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

          yield ScheduleTile(period: singlePeriod, onPressed: null);
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

      yield Expanded(
        child: periodWithMatchingSubgroup == null
            ? const SizedBox()
            : ScheduleTile(period: periodWithMatchingSubgroup, onPressed: null),
      );
    }
  }

  void _onSelectedDateChanged() =>
      _dateController.text = DateFormat("dd.MM.yy").format(_selectedDate.value);

  Future<void> _showDatePicker() async {
    const bool useTestData = .fromEnvironment("USE_TEST_DATA");
    final DateTime currentDate =
        (useTestData ? DateTime(2026, 2, 16) : DateTime.now()).asCropped();

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: useTestData ? null : _selectedDate.value,
      firstDate: currentDate.add(const .new(days: -7)),
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
    ..invalidate(schedulesProvider, asReload: true)
    ..invalidate(substitutionsProvider(_selectedDate.value), asReload: true);

  Future<void> get refreshProvidersFuture => .wait(<Future<void>>[
    ref.refresh(schedulesProvider.future),
    ref.refresh(substitutionsProvider(_selectedDate.value).future),
  ]);
}
