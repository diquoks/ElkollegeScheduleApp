import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:json_annotation/json_annotation.dart";
import "package:pocketbase/pocketbase.dart";

part "day_schedule_dto.g.dart";

@JsonSerializable()
class const DayScheduleDto({
  required final int weekday,
  required final List<PeriodDto> periods,
}) extends Dto {
  factory fromJson(Map<String, dynamic> json) => _$DayScheduleDtoFromJson(json);

  factory fromRecord(RecordModel record) => .fromJson(record.toJson());

  @override
  Map<String, dynamic> toJson() => _$DayScheduleDtoToJson(this);

  @override
  DayScheduleEntity toEntity() => .new(
    weekday: weekday,
    periods: periods.map((PeriodDto dto) => dto.toEntity()).toList(),
  );
}
