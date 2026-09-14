import "package:elkollege_schedule_app/elkollege_schedule_app.dart";

class const DayScheduleEntity({
  required final int weekday,
  required final List<PeriodEntity> periods,
}) extends Entity {
  @override
  DayScheduleDto toDto() => .new(
    weekday: weekday,
    periods: periods.map((PeriodEntity e) => e.toDto()).toList(),
  );
}

extension ListDayScheduleEntityUtilsX on List<DayScheduleEntity> {
  DayScheduleEntity? getByWeekday(int weekday) =>
      where((DayScheduleEntity e) => e.weekday == weekday).singleOrNull;
}
