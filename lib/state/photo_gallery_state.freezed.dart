// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'photo_gallery_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PhotoGalleryState {
  int get current => throw _privateConstructorUsedError;
  String get photoTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhotoGalleryStateCopyWith<PhotoGalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoGalleryStateCopyWith<$Res> {
  factory $PhotoGalleryStateCopyWith(
          PhotoGalleryState value, $Res Function(PhotoGalleryState) then) =
      _$PhotoGalleryStateCopyWithImpl<$Res, PhotoGalleryState>;
  @useResult
  $Res call({int current, String photoTime});
}

/// @nodoc
class _$PhotoGalleryStateCopyWithImpl<$Res, $Val extends PhotoGalleryState>
    implements $PhotoGalleryStateCopyWith<$Res> {
  _$PhotoGalleryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? photoTime = null,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      photoTime: null == photoTime
          ? _value.photoTime
          : photoTime // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhotoGalleryStateCopyWith<$Res>
    implements $PhotoGalleryStateCopyWith<$Res> {
  factory _$$_PhotoGalleryStateCopyWith(_$_PhotoGalleryState value,
          $Res Function(_$_PhotoGalleryState) then) =
      __$$_PhotoGalleryStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int current, String photoTime});
}

/// @nodoc
class __$$_PhotoGalleryStateCopyWithImpl<$Res>
    extends _$PhotoGalleryStateCopyWithImpl<$Res, _$_PhotoGalleryState>
    implements _$$_PhotoGalleryStateCopyWith<$Res> {
  __$$_PhotoGalleryStateCopyWithImpl(
      _$_PhotoGalleryState _value, $Res Function(_$_PhotoGalleryState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? photoTime = null,
  }) {
    return _then(_$_PhotoGalleryState(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      photoTime: null == photoTime
          ? _value.photoTime
          : photoTime // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_PhotoGalleryState implements _PhotoGalleryState {
  const _$_PhotoGalleryState({required this.current, required this.photoTime});

  @override
  final int current;
  @override
  final String photoTime;

  @override
  String toString() {
    return 'PhotoGalleryState(current: $current, photoTime: $photoTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PhotoGalleryState &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.photoTime, photoTime) ||
                other.photoTime == photoTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, current, photoTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhotoGalleryStateCopyWith<_$_PhotoGalleryState> get copyWith =>
      __$$_PhotoGalleryStateCopyWithImpl<_$_PhotoGalleryState>(
          this, _$identity);
}

abstract class _PhotoGalleryState implements PhotoGalleryState {
  const factory _PhotoGalleryState(
      {required final int current,
      required final String photoTime}) = _$_PhotoGalleryState;

  @override
  int get current;
  @override
  String get photoTime;
  @override
  @JsonKey(ignore: true)
  _$$_PhotoGalleryStateCopyWith<_$_PhotoGalleryState> get copyWith =>
      throw _privateConstructorUsedError;
}
