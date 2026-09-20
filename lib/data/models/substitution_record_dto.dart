import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:json_annotation/json_annotation.dart";
import "package:pocketbase/pocketbase.dart";

part "substitution_record_dto.g.dart";

@JsonSerializable(explicitToJson: true)
class const SubstitutionRecordDto({
  required final String id,
  required final String building,
  @PocketbaseDateTimeConverter() required final DateTime utcDate,
  required final List<SubstitutionDto> json,
  @PocketbaseDateTimeConverter() required final DateTime created,
  @PocketbaseDateTimeConverter() required final DateTime updated,
}) extends Dto {
  factory fromJson(Map<String, dynamic> json) =>
      _$SubstitutionRecordDtoFromJson(json);

  factory fromRecord(RecordModel record) => .fromJson(record.toJson());

  @override
  Map<String, dynamic> toJson() => _$SubstitutionRecordDtoToJson(this);

  @override
  SubstitutionRecordEntity toEntity() => .new(
    id: id,
    building: building,
    utcDate: utcDate,
    json: json.map((SubstitutionDto dto) => dto.toEntity()).toList(),
    created: created,
    updated: updated,
  );
}
