import "package:elkollege_schedule_app/elkollege_schedule_app.dart";

class const PeriodEntity({
  required final int number,
  required final int? subgroup,
  required final String subject,
  required final String lecturer,
  required final String room,
}) extends Entity;
