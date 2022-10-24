// ignore_for_file: avoid_dynamic_calls

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
      final map = <String, Map<String, String>>{};

      for (var i = 0; i < int.parse(value['list'].length.toString()); i++) {
        final oneData = value['list'][i];

        final map2 = <String, String>{};
        map2['address'] = oneData['address'].toString();
        map2['lat'] = oneData['lat'].toString();
        map2['lng'] = oneData['lng'].toString();

        map[oneData['temple'].toString()] = map2;
      }

      state = map;
    });
  }
}

//////////////////////////////////////////////////////
