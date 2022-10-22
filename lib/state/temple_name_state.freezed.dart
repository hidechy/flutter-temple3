// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'temple_name_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TempleNameState {
  List<Name> get record => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempleNameStateCopyWith<TempleNameState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempleNameStateCopyWith<$Res> {
  factory $TempleNameStateCopyWith(
          TempleNameState value, $Res Function(TempleNameState) then) =
      _$TempleNameStateCopyWithImpl<$Res, TempleNameState>;
  @useResult
  $Res call({List<Name> record});
}

/// @nodoc
class _$TempleNameStateCopyWithImpl<$Res, $Val extends TempleNameState>
    implements $TempleNameStateCopyWith<$Res> {
  _$TempleNameStateCopyWithImpl(this._value, this._then);

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
              as List<Name>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TempleNameStateCopyWith<$Res>
    implements $TempleNameStateCopyWith<$Res> {
  factory _$$_TempleNameStateCopyWith(
          _$_TempleNameState value, $Res Function(_$_TempleNameState) then) =
      __$$_TempleNameStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Name> record});
}

/// @nodoc
class __$$_TempleNameStateCopyWithImpl<$Res>
    extends _$TempleNameStateCopyWithImpl<$Res, _$_TempleNameState>
    implements _$$_TempleNameStateCopyWith<$Res> {
  __$$_TempleNameStateCopyWithImpl(
      _$_TempleNameState _value, $Res Function(_$_TempleNameState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? record = null,
  }) {
    return _then(_$_TempleNameState(
      record: null == record
          ? _value._record
          : record // ignore: cast_nullable_to_non_nullable
              as List<Name>,
    ));
  }
}

/// @nodoc

class _$_TempleNameState implements _TempleNameState {
  const _$_TempleNameState({required final List<Name> record})
      : _record = record;

  final List<Name> _record;
  @override
  List<Name> get record {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_record);
  }

  @override
  String toString() {
    return 'TempleNameState(record: $record)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempleNameState &&
            const DeepCollectionEquality().equals(other._record, _record));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_record));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TempleNameStateCopyWith<_$_TempleNameState> get copyWith =>
      __$$_TempleNameStateCopyWithImpl<_$_TempleNameState>(this, _$identity);
}

abstract class _TempleNameState implements TempleNameState {
  const factory _TempleNameState({required final List<Name> record}) =
      _$_TempleNameState;

  @override
  List<Name> get record;
  @override
  @JsonKey(ignore: true)
  _$$_TempleNameStateCopyWith<_$_TempleNameState> get copyWith =>
      throw _privateConstructorUsedError;
}
