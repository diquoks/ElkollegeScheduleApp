import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/misc.dart";

final FutureProvider<List<ScheduleRecordEntity>> scheduleRecordsProvider =
    .autoDispose((Ref ref) async {
      final PocketbaseClient client = await ref.getDebouncedPocketbaseClient();

      final List<ScheduleRecordDto> response = await client.getSchedules();
      return response.map((ScheduleRecordDto dto) => dto.toEntity()).toList();
    });

final FutureProviderFamily<List<SubstitutionRecordEntity>, DateTime>
substitutionRecordsProvider = FutureProvider.autoDispose
    .family<List<SubstitutionRecordEntity>, DateTime>((
      Ref ref,
      DateTime date,
    ) async {
      final PocketbaseClient client = await ref.getDebouncedPocketbaseClient();

      final List<SubstitutionRecordDto> response = await client
          .getSubstitutions(date.crop().asUtc());
      return response
          .map((SubstitutionRecordDto dto) => dto.toEntity())
          .toList();
    });

extension DateTimeUtilsX on DateTime {
  DateTime crop() =>
      copyWith(hour: 0, minute: 0, second: 0, millisecond: 0, microsecond: 0);

  DateTime asUtc() => copyWith(isUtc: true);
}
