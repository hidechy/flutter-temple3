import 'package:hooks_riverpod/hooks_riverpod.dart';

//////////////////////////////////////////////////////

final drawnOpenProvider =
    StateNotifierProvider.autoDispose<DrawnOpenStateNotifier, int>((ref) {
  return DrawnOpenStateNotifier();
});

class DrawnOpenStateNotifier extends StateNotifier<int> {
  DrawnOpenStateNotifier() : super(0);

  Future<void> setValue({required int value}) async {
    state = value;
  }
}

//////////////////////////////////////////////////////

//////////////////////////////////////////////////////

final mapTypeProvider =
    StateNotifierProvider.autoDispose<MapTypeStateNotifier, int>((ref) {
  return MapTypeStateNotifier();
});

class MapTypeStateNotifier extends StateNotifier<int> {
  MapTypeStateNotifier() : super(0);

  Future<void> setValue({required int value}) async {
    state = value;
  }
}

//////////////////////////////////////////////////////

//////////////////////////////////////////////////////

final dispPolylineProvider =
    StateNotifierProvider.autoDispose<DispPolylineStateNotifier, int>((ref) {
  return DispPolylineStateNotifier();
});

class DispPolylineStateNotifier extends StateNotifier<int> {
  DispPolylineStateNotifier() : super(0);

  Future<void> setValue({required int value}) async {
    state = value;
  }
}

//////////////////////////////////////////////////////

//////////////////////////////////////////////////////

final enlargeProvider =
    StateNotifierProvider.autoDispose<EnlargeStateNotifier, int>((ref) {
  return EnlargeStateNotifier();
});

class EnlargeStateNotifier extends StateNotifier<int> {
  EnlargeStateNotifier() : super(0);

  Future<void> setValue({required int value}) async {
    state = value;
  }
}

//////////////////////////////////////////////////////
