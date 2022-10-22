import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/name.dart';

part 'temple_name_state.freezed.dart';

@freezed
class TempleNameState with _$TempleNameState {
  const factory TempleNameState({
    required List<Name> record,
  }) = _TempleNameState;
}
