import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final FutureProvider<List<GroupScheduleEntity>> schedulesProvider =
    .autoDispose((Ref ref) async {
      final PocketbaseClient client = ref.watch(pocketbaseClientProvider);

      final List<ScheduleRecordDto> response = await client.getSchedules();
      return response
          .map((ScheduleRecordDto dto) => dto.toEntity())
          .expand((ScheduleRecordEntity entity) => entity.json)
          .toList();
    });
