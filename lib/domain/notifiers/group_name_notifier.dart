import "package:elkollege_schedule_app/elkollege_schedule_app.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

final NotifierProvider<GroupNameNotifier, String?> groupNameProvider = .new(
  GroupNameNotifier.new,
);

class GroupNameNotifier extends Notifier<String?> {
  @override
  String? build() {
    final StorageUseCase storageUseCase = ref.watch(storageUseCaseProvider);

    return storageUseCase.groupName;
  }

  Future<void> setGroupName(String value) async {
    state = value;

    await ref.read(storageUseCaseProvider).setGroupName(state!);
  }
}
