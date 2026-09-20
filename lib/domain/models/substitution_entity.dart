import "package:elkollege_schedule_app/elkollege_schedule_app.dart";

class const SubstitutionEntity({
  required final String groupName,
  required final PeriodEntity? period,
  required final PeriodEntity? substitution,
}) extends Entity {
  @override
  SubstitutionDto toDto() => .new(
    groupName: groupName,
    period: period?.toDto(),
    substitution: substitution?.toDto(),
  );
}

extension ListSubstitutionEntityUtilsX on List<SubstitutionEntity> {
  List<SubstitutionEntity> getWithSameGroupName(String? groupName) =>
      where((SubstitutionEntity e) => e.groupName == groupName).toList();
}
