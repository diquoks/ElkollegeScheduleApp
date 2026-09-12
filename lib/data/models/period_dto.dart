import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:json_annotation/json_annotation.dart";
import "package:pocketbase/pocketbase.dart";

part "period_dto.g.dart";

@JsonSerializable()
class const PeriodDto({
  required final int number,
  required final int? subgroup,
  required final String subject,
  required final String lecturer,
  required final String room,
}) extends Dto {
  factory fromJson(Map<String, dynamic> json) => _$PeriodDtoFromJson(json);

  factory fromRecord(RecordModel record) => .fromJson(record.toJson());

  @override
  Map<String, dynamic> toJson() => _$PeriodDtoToJson(this);

  @override
  PeriodEntity toEntity() => .new(
    number: number,
    subgroup: subgroup,
    subject: subject,
    lecturer: lecturer,
    room: room,
  );
}
