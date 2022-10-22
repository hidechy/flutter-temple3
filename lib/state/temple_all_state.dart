import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/temple.dart';

part 'temple_all_state.freezed.dart';

@freezed
class TempleAllState with _$TempleAllState {
  const factory TempleAllState({
    required List<Temple> record,
  }) = _TempleAllState;
}
