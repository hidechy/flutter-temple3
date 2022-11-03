// ignore_for_file: avoid_dynamic_calls

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data/http/client.dart';
import '../models/temple.dart';
import '../state/temple_all_state.dart';

//////////////////////////////////////////////////////

final templeAllProvider = StateNotifierProvider.family
    .autoDispose<TempleAllNotifier, TempleAllState, String>((ref, year) {
  final client = ref.read(httpClientProvider);

  return TempleAllNotifier(
    const TempleAllState(record: []),
    client,
  )..getAllTemple(year: year);
});

class TempleAllNotifier extends StateNotifier<TempleAllState> {
  TempleAllNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getAllTemple({required String year}) async {
    await client.post(path: 'getAllTemple').then((value) {
      final list = <Temple>[];
      for (var i = 0; i < int.parse(value['list'].length.toString()); i++) {
        final exDate = value['list'][i]['date'].toString().split('-');
        if (year == exDate[0]) {
          final oneData = value['list'][i];

          final list2 = <String>[];
          for (var j = 0;
              j < int.parse(oneData['photo'].length.toString());
              j++) {
            list2.add(oneData['photo'][j].toString());
          }

          list.add(
            Temple(
              date: DateTime.parse(oneData['date'].toString()),
              temple: oneData['temple'].toString(),
              address: oneData['address'].toString(),
              station: oneData['station'].toString(),
              memo: oneData['memo'].toString(),
              gohonzon: oneData['gohonzon'].toString(),
              thumbnail: oneData['thumbnail'].toString(),
              lat: oneData['lat'].toString(),
              lng: oneData['lng'].toString(),
              photo: list2,
            ),
          );
        }
      }
      state = state.copyWith(record: list);
    });
  }
}

//////////////////////////////////////////////////////

//////////////////////////////////////////////////////

final yearListProvider =
    StateNotifierProvider.autoDispose<YearListNotifier, Map<String, int>>(
        (ref) {
  final client = ref.read(httpClientProvider);

  return YearListNotifier({}, client)..getYearList();
});

class YearListNotifier extends StateNotifier<Map<String, int>> {
  YearListNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getYearList() async {
    await client.post(path: 'getAllTemple').then((value) {
      final map = <String, List<String>>{};

      var list = <String>[];

      var keepYear = '';

      for (var i = 0; i < int.parse(value['list'].length.toString()); i++) {
        final exDate = value['list'][i]['date'].toString().split('-');

        if (exDate[0] != keepYear) {
          list = <String>[];
        }

        list.add(value['list'][i]['date'].toString().split(' ')[0]);

        map[exDate[0]] = list;

        keepYear = exDate[0];
      }

      final map2 = <String, int>{};

      map.forEach((key, value) {
        map2[key] = value.length;
      });

      state = map2;
    });
  }
}

//////////////////////////////////////////////////////

//////////////////////////////////////////////////////

final dateListProvider =
    StateNotifierProvider.autoDispose<DateListNotifier, Map<String, Temple>>(
        (ref) {
  final client = ref.read(httpClientProvider);

  return DateListNotifier({}, client)..getDateList();
});

class DateListNotifier extends StateNotifier<Map<String, Temple>> {
  DateListNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getDateList() async {
    await client.post(path: 'getAllTemple').then((value) {
      final map = <String, Temple>{};
      for (var i = 0; i < int.parse(value['list'].length.toString()); i++) {
        final oneData = value['list'][i];

        final list2 = <String>[];
        for (var j = 0;
            j < int.parse(oneData['photo'].length.toString());
            j++) {
          list2.add(oneData['photo'][j].toString());
        }

        map[oneData['date'].toString()] = Temple(
          date: DateTime.parse(oneData['date'].toString()),
          temple: oneData['temple'].toString(),
          address: oneData['address'].toString(),
          station: oneData['station'].toString(),
          memo: oneData['memo'].toString(),
          gohonzon: oneData['gohonzon'].toString(),
          thumbnail: oneData['thumbnail'].toString(),
          lat: oneData['lat'].toString(),
          lng: oneData['lng'].toString(),
          photo: list2,
        );
      }
      state = map;
    });
  }
}

//////////////////////////////////////////////////////

//////////////////////////////////////////////////////

final yearlyAllTempleProvider = StateNotifierProvider.autoDispose
    .family<YearlyAllTempleNotifier, List<String>, String>((ref, year) {
  final client = ref.read(httpClientProvider);
  return YearlyAllTempleNotifier([], client)..getYearlyAllTemple(year: year);
});

class YearlyAllTempleNotifier extends StateNotifier<List<String>> {
  YearlyAllTempleNotifier(super.state, this.client);

  final HttpClient client;

  Future<void> getYearlyAllTemple({required String year}) async {
    await client.post(path: 'getAllTemple').then((value) {
      final list = <String>[];
      for (var i = 0; i < int.parse(value['list'].length.toString()); i++) {
        final oneData = value['list'][i];

        final exDate = oneData['date'].toString().split('-');
        if (year == exDate[0]) {
          if (!list.contains(oneData['temple'].toString())) {
            list.add(oneData['temple'].toString());
            if (oneData['memo'] != '') {
              final exMemo = oneData['memo'].toString().split('、');
              for (var j = 0; j < exMemo.length; j++) {
                if (!list.contains(exMemo[j])) {
                  list.add(exMemo[j]);
                }
              }
            }
          }
        }
      }

      state = list;
    });
  }
}

//////////////////////////////////////////////////////
