import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_value_state.freezed.dart';

@freezed
class AppValueState with _$AppValueState {
  const factory AppValueState({
    //
    required bool isDrawnOpen,
    //
    required bool isDefaultmap,
    required bool isPolylineDisp,
    required bool isLargeMap,
    required bool isZenpukuji,
    required bool isMemoDispLineLimit,
  }) = _AppValueState;
}
