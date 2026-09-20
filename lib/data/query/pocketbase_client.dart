import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:pocketbase/pocketbase.dart";

class const PocketbaseClient({required final PocketBase _pb}) {
  static const String _schedules = "schedules";

  static const String _substitutions = "substitutions";

  Future<List<ScheduleRecordDto>> getSchedules() async {
    final List<RecordModel> response = await _pb
        .collection(_schedules)
        .getFullList();

    return response.map(ScheduleRecordDto.fromRecord).toList();
  }

  Future<List<SubstitutionRecordDto>> getSubstitutions(DateTime utcDate) async {
    final List<RecordModel> response = await _pb
        .collection(_substitutions)
        .getFullList(filter: "utcDate = '$utcDate'");

    return response.map(SubstitutionRecordDto.fromRecord).toList();
  }
}

extension RefDebouncedPocketbaseClientX on Ref {
  Future<PocketbaseClient> getDebouncedPocketbaseClient() async {
    const String pocketbaseBaseUrl = .fromEnvironment("POCKETBASE_BASE_URL");

    if (pocketbaseBaseUrl.isEmpty) {
      throw StateError("POCKETBASE_BASE_URL environment variable is not set!");
    }

    bool didDispose = false;
    onDispose(() => didDispose = true);

    await Future<void>.delayed(const .new(milliseconds: 500));

    if (didDispose) {
      throw Exception("The associated request was cancelled.");
    }

    final PocketbaseClient client = .new(
      pb: .new(pocketbaseBaseUrl, reuseHTTPClient: true),
    );
    onDispose(client._pb.close);

    return client;
  }
}
