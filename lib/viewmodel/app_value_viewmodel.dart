import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:temple/state/app_value_state.dart';

//////////////////////////////////////////////////////

final appValueProvider =
    StateNotifierProvider.autoDispose<AppValueStateNotifier, AppValueState>(
        (ref) {
  return AppValueStateNotifier(
    const AppValueState(
      isDrawnOpen: false,
      isDefaultmap: false,
      isPolylineDisp: false,
      isLargeMap: false,
      isZenpukuji: false,
    ),
  );
});

class AppValueStateNotifier extends StateNotifier<AppValueState> {
  AppValueStateNotifier(super.state);

  Future<void> setDrawnOpen({required bool value}) async {
    state = state.copyWith(isDrawnOpen: value);
  }

  Future<void> setMapType({required bool value}) async {
    state = state.copyWith(isDefaultmap: value);
  }

  Future<void> setDispPolyline({required bool value}) async {
    state = state.copyWith(isPolylineDisp: value);
  }

  Future<void> setEnlarge({required bool value}) async {
    state = state.copyWith(isLargeMap: value);
  }

  Future<void> setZenpukuji({required bool value}) async {
    state = state.copyWith(isZenpukuji: value);
  }
}

//////////////////////////////////////////////////////
