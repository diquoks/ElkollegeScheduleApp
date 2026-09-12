import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:json_annotation/json_annotation.dart";
import "package:pocketbase/pocketbase.dart";

part "schedule_record_dto.g.dart";

@JsonSerializable()
class const ScheduleRecordDto({
  required final String collectionId,
  required final String collectionName,
  required final String id,
  required final String building,
  required final List<GroupScheduleDto> json,
  required final DateTime created,
  required final DateTime updated,
}) extends Dto {
  factory fromJson(Map<String, dynamic> json) =>
      _$ScheduleRecordDtoFromJson(json);

  factory fromRecord(RecordModel record) => .fromJson(record.toJson());

  @override
  Map<String, dynamic> toJson() => _$ScheduleRecordDtoToJson(this);

  @override
  ScheduleRecordEntity toEntity() => .new(
    id: id,
    building: building,
    json: json.map((GroupScheduleDto dto) => dto.toEntity()).toList(),
    created: created,
    updated: updated,
  );
}
