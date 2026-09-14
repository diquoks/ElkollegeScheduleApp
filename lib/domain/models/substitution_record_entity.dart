import "package:elkollege_schedule_app/elkollege_schedule_app.dart";

class const SubstitutionRecordEntity({
  required final String id,
  required final String building,
  required final DateTime utcDate,
  required final List<SubstitutionEntity> json,
  required final DateTime created,
  required final DateTime updated,
}) extends Entity {
  @override
  SubstitutionRecordDto toDto() => .new(
    id: id,
    building: building,
    utcDate: utcDate,
    json: json.map((SubstitutionEntity e) => e.toDto()).toList(),
    created: created,
    updated: updated,
  );
}
