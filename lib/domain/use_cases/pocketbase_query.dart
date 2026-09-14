import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart";

final FutureProvider<List<GroupScheduleEntity>> schedulesProvider =
    .autoDispose((Ref ref) async {
      final PocketbaseClient client = await ref.getDebouncedPocketbaseClient();

      final List<ScheduleRecordDto> response = await client.getSchedules();
      return response
          .map((ScheduleRecordDto dto) => dto.toEntity())
          .expand((ScheduleRecordEntity e) => e.json)
          .toList();
    });

final FutureProviderFamily<List<SubstitutionEntity>, DateTime>
substitutionsProvider = FutureProvider.autoDispose
    .family<List<SubstitutionEntity>, DateTime>((Ref ref, DateTime date) async {
      final PocketbaseClient client = await ref.getDebouncedPocketbaseClient();

      final List<SubstitutionRecordDto> response = await client
          .getSubstitutions(date.asCropped().asUtc());
      return response
          .map((SubstitutionRecordDto dto) => dto.toEntity())
          .expand((SubstitutionRecordEntity e) => e.json)
          .toList();
    });

extension DateTimeUtilsX on DateTime {
  DateTime asCropped() =>
      copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

  DateTime asUtc() => copyWith(isUtc: true);
}
