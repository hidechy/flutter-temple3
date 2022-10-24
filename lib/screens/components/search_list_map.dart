// ignore_for_file: library_prefixes, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gMap;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/latlng.dart';

class SearchListMap extends ConsumerWidget {
  final List<LatLng> data;

  SearchListMap({Key? key, required this.data}) : super(key: key);

  late gMap.LatLng latLng;
  late gMap.CameraPosition initialCameraPosition;
  final Set<gMap.Marker> markers = {};

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    latLng = gMap.LatLng(double.parse(data[0].lat), double.parse(data[0].lng));
    initialCameraPosition =
        gMap.CameraPosition(target: latLng, zoom: 15, tilt: 50);

    for (var i = 0; i < data.length; i++) {
      markers.add(
        gMap.Marker(
          markerId: gMap.MarkerId('temple$i'),
          position:
              gMap.LatLng(double.parse(data[i].lat), double.parse(data[i].lng)),
          infoWindow: gMap.InfoWindow(
            title: data[i].temple,
            snippet: data[i].address,
          ),
          icon: gMap.BitmapDescriptor.defaultMarkerWithHue(
            gMap.BitmapDescriptor.hueRed,
          ),
        ),
      );
    }

    return SizedBox(
      height: 200,
      child: gMap.GoogleMap(
        initialCameraPosition: initialCameraPosition,
        markers: markers,
      ),
    );
  }
}
