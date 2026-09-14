import "package:elkollege_schedule_app/elkollege_schedule_app.dart";

class const GroupScheduleEntity({
  required final String groupName,
  required final List<DayScheduleEntity> daySchedules,
}) extends Entity {
  @override
  GroupScheduleDto toDto() => .new(
    groupName: groupName,
    daySchedules: daySchedules.map((DayScheduleEntity e) => e.toDto()).toList(),
  );
}

extension ListGroupScheduleEntityUtilsX on List<GroupScheduleEntity> {
  GroupScheduleEntity? getByGroupName(String? groupName) =>
      where((GroupScheduleEntity e) => e.groupName == groupName).singleOrNull;
}
