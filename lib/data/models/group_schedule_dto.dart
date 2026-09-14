import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:json_annotation/json_annotation.dart";

part "group_schedule_dto.g.dart";

@JsonSerializable(explicitToJson: true)
class const GroupScheduleDto({
  required final String groupName,
  required final List<DayScheduleDto> daySchedules,
}) extends Dto {
  factory fromJson(Map<String, dynamic> json) =>
      _$GroupScheduleDtoFromJson(json);

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
