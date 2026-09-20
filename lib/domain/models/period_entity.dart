import "package:elkollege_schedule_app/elkollege_schedule_app.dart";

class const PeriodEntity({
  required final int number,
  required final int? subgroup,
  required final String subject,
  required final String lecturer,
  required final String room,
}) extends Entity {
  @override
  PeriodDto toDto() => .new(
    number: number,
    subgroup: subgroup,
    subject: subject,
    lecturer: lecturer,
    room: room,
  );
}

extension ListPeriodEntityUtilsX on List<PeriodEntity> {
  PeriodEntity? getBySubgroup(int? subgroup) =>
      where((PeriodEntity e) => e.subgroup == subgroup).singleOrNull;

  List<PeriodEntity> getWithSameNumber(int number) =>
      where((PeriodEntity e) => e.number == number).toList();

  List<PeriodEntity> applySubstitutions(
    List<SubstitutionEntity> substitutions,
  ) {
    final List<PeriodEntity> periods = toList();

    for (final SubstitutionEntity substitution in substitutions) {
      if (substitution.period != null) {
        periods.removeWhere(
          (PeriodEntity e) =>
              e.number == substitution.period!.number &&
              e.subgroup == substitution.period!.subgroup,
        );
      }

      if (substitution.substitution != null) {
        if (substitution.substitution!.subject.isEmpty) {
          continue; // TODO: make parser not to return empty periods
        }

        periods.add(substitution.substitution!);
      }
    }

    return periods;
  }
}
