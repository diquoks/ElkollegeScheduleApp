import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:json_annotation/json_annotation.dart";

part "substitution_dto.g.dart";

@JsonSerializable(explicitToJson: true)
class const SubstitutionDto({
  required final String groupName,
  required final PeriodDto? period,
  required final PeriodDto? substitution,
}) extends Dto {
  factory fromJson(Map<String, dynamic> json) =>
      _$SubstitutionDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SubstitutionDtoToJson(this);

  @override
  SubstitutionEntity toEntity() => .new(
    groupName: groupName,
    period: period?.toEntity(),
    substitution: substitution?.toEntity(),
  );
}
