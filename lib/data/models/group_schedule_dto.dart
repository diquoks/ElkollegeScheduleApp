import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:json_annotation/json_annotation.dart";
import "package:pocketbase/pocketbase.dart";

part "group_schedule_dto.g.dart";

@JsonSerializable()
class const GroupScheduleDto({
  required final String groupName,
  required final List<DayScheduleDto> daySchedules,
}) extends Dto {
  factory fromJson(Map<String, dynamic> json) =>
      _$GroupScheduleDtoFromJson(json);

  factory fromRecord(RecordModel record) => .fromJson(record.toJson());

  @override
  Map<String, dynamic> toJson() => _$GroupScheduleDtoToJson(this);

  @override
  GroupScheduleEntity toEntity() => .new(
    groupName: groupName,
    daySchedules: daySchedules
        .map((DayScheduleDto dto) => dto.toEntity())
        .toList(),
  );
}
