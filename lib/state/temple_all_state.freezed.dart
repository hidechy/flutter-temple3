// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'temple_all_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TempleAllState {
  List<Temple> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempleAllStateCopyWith<TempleAllState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempleAllStateCopyWith<$Res> {
  factory $TempleAllStateCopyWith(
          TempleAllState value, $Res Function(TempleAllState) then) =
      _$TempleAllStateCopyWithImpl<$Res, TempleAllState>;
  @useResult
  $Res call({List<Temple> record});
}

/// @nodoc
class _$TempleAllStateCopyWithImpl<$Res, $Val extends TempleAllState>
    implements $TempleAllStateCopyWith<$Res> {
  _$TempleAllStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_value.copyWith(
      record: null == record
          ? _value.record
          : record // ignore: cast_nullable_to_non_nullable
              as List<Temple>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TempleAllStateCopyWith<$Res>
    implements $TempleAllStateCopyWith<$Res> {
  factory _$$_TempleAllStateCopyWith(
          _$_TempleAllState value, $Res Function(_$_TempleAllState) then) =
      __$$_TempleAllStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Temple> record});
}

/// @nodoc
class __$$_TempleAllStateCopyWithImpl<$Res>
    extends _$TempleAllStateCopyWithImpl<$Res, _$_TempleAllState>
    implements _$$_TempleAllStateCopyWith<$Res> {
  __$$_TempleAllStateCopyWithImpl(
      _$_TempleAllState _value, $Res Function(_$_TempleAllState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$_TempleAllState(
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as List<Temple>,
    ));
  }
}

/// @nodoc

class _$_TempleAllState implements _TempleAllState {
  const _$_TempleAllState({required final List<Temple> record})
      : _record = record;

  final List<Temple> _record;
  @override
  List<Temple> get record {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_record);
  }

  @override
  String toString() {
    return 'TempleAllState(record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempleAllState &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TempleAllStateCopyWith<_$_TempleAllState> get copyWith =>
      __$$_TempleAllStateCopyWithImpl<_$_TempleAllState>(this, _$identity);
}

abstract class _TempleAllState implements TempleAllState {
  const factory _TempleAllState({required final List<Temple> record}) =
      _$_TempleAllState;

  @override
  List<Temple> get record;
  @override
  @JsonKey(ignore: true)
  _$$_TempleAllStateCopyWith<_$_TempleAllState> get copyWith =>
      throw _privateConstructorUsedError;
}
