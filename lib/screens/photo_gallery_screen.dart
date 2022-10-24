// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layouts/default_layout.dart';
import '../models/temple.dart';
import '../viewmodel/photo_gallery_viewmodel.dart';

class PhotoGalleryScreen extends ConsumerWidget {
  PhotoGalleryScreen({super.key, required this.temple});

  final Temple temple;

  late BuildContext _context;
  late WidgetRef _ref;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _context = context;
    _ref = ref;

    final photoGalleryState = ref.watch(photoGalleryProvider(temple.photo));

    return DefaultLayout(
      title: '',
      isTitleDisplay: false,
      widget: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(10),
                alignment: Alignment.topRight,
                child: GestureDetector(
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Text(temple.date.toString().split(' ')[0]),
              Text(
                temple.temple,
                style: const TextStyle(fontSize: 24),
              ),
              if (temple.memo != '')
                Text(
                  'with.${temple.memo}',
                  style: const TextStyle(color: Colors.grey),
                ),
              Container(
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(color: Colors.red[900]),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  photoGalleryState.photoTime,
                  style: const TextStyle(fontSize: 25),
                ),
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 470,
                  enlargeCenterPage: true,
                  onPageChanged: (index, _) {
                    ref
                        .watch(photoGalleryProvider(temple.photo).notifier)
                        .setCurrentPhoto(value: index);

                    ref
                        .watch(photoGalleryProvider(temple.photo).notifier)
                        .setPhotoTime(value: temple.photo[index]);
                  },
                ),
                items: temple.photo.map(
                  (imgUrl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.network(
                            imgUrl,
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ],
          ),
          makeIndicator(),
        ],
      ),
    );
  }

  ///
  Widget makeIndicator() {
    final photoGalleryState = _ref.watch(photoGalleryProvider(temple.photo));

    final list = <Widget>[];

    final size = MediaQuery.of(_context).size;

    for (var i = 0; i < temple.photo.length; i++) {
      list.add(
        Container(
          width: 20,
          height: 5,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (photoGalleryState.current == i)
                ? Colors.redAccent
                : Colors.grey,
          ),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(height: size.height / 10 * 9),
        Wrap(children: list),
      ],
    );
  }
}
