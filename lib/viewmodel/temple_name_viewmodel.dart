import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/http/client.dart';
import '../state/temple_name_state.dart';

final templeNameProvider =
    StateNotifierProvider.autoDispose<TempleNameNotifier, TempleNameState>(
        (ref) {
  final client = ref.read(httpClientProvider);

  return TempleNameNotifier(
    const TempleNameState(record: []),
    client,
  );
});

class TempleNameNotifier extends StateNotifier<TempleNameState> {
  TempleNameNotifier(super.state, this.client);

  final HttpClient client;

  ///
  Future<void> getNameTemple({required String name}) async {}
}
