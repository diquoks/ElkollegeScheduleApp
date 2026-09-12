import "package:elkollege_schedule_app/elkollege_schedule_app.dart";

class const ScheduleRecordEntity({
  required final String id,
  required final String building,
  required final List<GroupScheduleEntity> json,
  required final DateTime created,
  required final DateTime updated,
}) extends Entity;
