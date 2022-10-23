import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:temple/utility/utility.dart';

import '../state/photo_gallery_state.dart';

//////////////////////////////////////////////////////

final photoGalleryProvider = StateNotifierProvider.autoDispose
    .family<PhotoGalleryStateNotifier, PhotoGalleryState, List<String>>(
        (ref, param) {
  Utility utility = Utility();

  return PhotoGalleryStateNotifier(
    PhotoGalleryState(
      current: 0,
      photoTime: utility.makePhotoTime(value: param[0]),
    ),
  );
});

class PhotoGalleryStateNotifier extends StateNotifier<PhotoGalleryState> {
  PhotoGalleryStateNotifier(super.state);

  final Utility utility = Utility();

  ///
  Future<void> setCurrentPhoto({required int value}) async {
    state = state.copyWith(current: value);
  }

  ///
  Future<void> setPhotoTime({required String value}) async {
    var photoTime = utility.makePhotoTime(value: value);

    state = state.copyWith(photoTime: photoTime);
  }
}

//////////////////////////////////////////////////////
