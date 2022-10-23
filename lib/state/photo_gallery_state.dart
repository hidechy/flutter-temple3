import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_gallery_state.freezed.dart';

@freezed
class PhotoGalleryState with _$PhotoGalleryState {
  const factory PhotoGalleryState({
    required int current,
    required String photoTime,
  }) = _PhotoGalleryState;
}
