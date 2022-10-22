import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/http/client.dart';

//////////////////////////////////////////////////////

final templeLatLngProvider = StateNotifierProvider.autoDispose<
    TempleLatLngNotifier, Map<String, Map<String, String>>>((ref) {
  final client = ref.read(httpClientProvider);

  return TempleLatLngNotifier(
    {},
    client,
  )..getLatLngTemple();
});

class TempleLatLngNotifier
    extends StateNotifier<Map<String, Map<String, String>>> {
  TempleLatLngNotifier(super.state, this.client);

  final HttpClient client;

  ///
  Future<void> getLatLngTemple() async {
    await client.post(path: 'getTempleLatLng').then((value) {
      Map<String, Map<String, String>> map = {};

      for (var i = 0; i < int.parse(value['list'].length.toString()); i++) {
        final oneData = value['list'][i];

        Map<String, String> map2 = {};
        map2['address'] = oneData['address'];
        map2['lat'] = oneData['lat'];
        map2['lng'] = oneData['lng'];

        map[oneData['temple']] = map2;
      }

      state = map;
    });
  }
}

//////////////////////////////////////////////////////
