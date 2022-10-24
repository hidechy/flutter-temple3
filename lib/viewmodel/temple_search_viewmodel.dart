// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/http/client.dart';

import '../models/latlng.dart';
import '../models/name.dart';

//////////////////////////////////////////////////////

final templeSearchProvider =
    StateNotifierProvider.autoDispose<TempleSearchNotifier, List<Name>>((ref) {
  final client = ref.read(httpClientProvider);

  return TempleSearchNotifier(
    [],
    client,
  );
});

class TempleSearchNotifier extends StateNotifier<List<Name>> {
  TempleSearchNotifier(super.state, this.client);

  final HttpClient client;

  ///
  Future<void> getSearchTemple({required String name}) async {
    await client
        .post(path: 'getTempleName', body: {'name': name}).then((value) {
      final list = <Name>[];
      for (var i = 0; i < int.parse(value['list'].length.toString()); i++) {
        final oneData = value['list'][i];

        final list2 = <LatLng>[];
        for (var j = 0; j < int.parse(oneData['data'].length.toString()); j++) {
          list2.add(
            LatLng(
              temple: oneData['data'][j]['temple'].toString(),
              address: oneData['data'][j]['address'].toString(),
              lat: oneData['data'][j]['lat'].toString(),
              lng: oneData['data'][j]['lng'].toString(),
            ),
          );
        }

        list.add(
          Name(
            year: oneData['year'].toString(),
            month: oneData['month'].toString(),
            day: oneData['day'].toString(),
            data: list2,
          ),
        );
      }

      state = list;

      /*

{
    "list": [
        {
            "year": "2015",
            "month": "05",
            "day": "30",
            "data": [
                {
                    "temple": "善光寺",
                    "address": "長野県長野市元善町491",
                    "lat": "36.6622551",
                    "lng": "138.1882753"
                }
            ]
        },
        {
            "year": "2019",
            "month": "03",
            "day": "30",
            "data": [
                {
                    "temple": "善光寺",
                    "address": "長野県長野市元善町491",
                    "lat": "36.6622551",
                    "lng": "138.1882753"
                },
                {
                    "temple": "豊川稲荷東京別院",
                    "address": "東京都港区元赤坂1-4-7",
                    "lat": "35.676684",
                    "lng": "139.73297"
                },
                {
                    "temple": "日枝神社",
                    "address": "東京都千代田区永田町2-10-5",
                    "lat": "35.6745509",
                    "lng": "139.7403246"
                },
                {
                    "temple": "愛宕神社",
                    "address": "東京都港区愛宕1-5-3",
                    "lat": "35.6650691",
                    "lng": "139.7485152"
                }
            ]
        },
        {
            "year": "2022",
            "month": "04",
            "day": "19",
            "data": [
                {
                    "temple": "善光寺",
                    "address": "長野県長野市元善町491",
                    "lat": "36.6622551",
                    "lng": "138.1882753"
                },
                {
                    "temple": "柳原神社(善光寺七社)",
                    "address": "長野県長野市4",
                    "lat": "36.6485258",
                    "lng": "138.1950371"
                },
                {
                    "temple": "西光寺",
                    "address": "長野県長野市大字南長野北石堂町1398",
                    "lat": "36.6469007",
                    "lng": "138.1855761"
                },
                {
                    "temple": "大国主神社",
                    "address": "長野県長野市大字南長野南県町南県町1044-4",
                    "lat": "36.6504267",
                    "lng": "138.1840226"
                },
                {
                    "temple": "秋葉神社",
                    "address": "東京都台東区松が谷3-10-7",
                    "lat": "35.7165045",
                    "lng": "139.7858429"
                },
                {
                    "temple": "往生院 (善光寺七寺)",
                    "address": "長野県長野市大字鶴賀権堂町2321",
                    "lat": "36.6525035",
                    "lng": "138.1914796"
                },
                {
                    "temple": "西宮神社",
                    "address": "長野県長野市岩石町257",
                    "lat": "36.6574133",
                    "lng": "138.1905474"
                },
                {
                    "temple": "善光寺世尊院",
                    "address": "長野県長野市長野元善町475",
                    "lat": "36.6587301",
                    "lng": "138.187751"
                }
            ]
        }
    ]
}






      */

      // Map<String, Map<String, String>> map = {};
      //
      // for (var i = 0; i < int.parse(value['list'].length.toString()); i++) {
      //   final oneData = value['list'][i];
      //
      //   Map<String, String> map2 = {};
      //   map2['address'] = oneData['address'];
      //   map2['lat'] = oneData['lat'];
      //   map2['lng'] = oneData['lng'];
      //
      //   map[oneData['temple']] = map2;
      // }
      //
      // state = map;
    });
  }
}

//////////////////////////////////////////////////////
