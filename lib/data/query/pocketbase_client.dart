import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pocketbase/pocketbase.dart";

final Provider<PocketbaseClient> pocketbaseClientProvider = .new(
  (Ref ref) => .new(pb: ref.watch(pocketbaseProvider)),
);

class PocketbaseClient {
  const new({required this._pb});

  final PocketBase _pb;

  RecordService get _schedules => _pb.collection("schedules");

  Future<List<ScheduleRecordDto>> getSchedules() async {
    final List<RecordModel> response = await _schedules.getFullList();

    return response.map(ScheduleRecordDto.fromRecord).toList();
  }
}
