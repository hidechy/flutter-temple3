// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:temple/state/polyline_param_state.dart';

import '../layouts/default_layout.dart';
import '../models/temple.dart';
import '../viewmodel/app_value_viewmodel.dart';
import '../viewmodel/polyline_viewmodel.dart';
import '../viewmodel/temple_latlng_viewmodel.dart';

class TempleDetailDisplayScreen extends ConsumerWidget {
  final Temple temple;

  TempleDetailDisplayScreen({Key? key, required this.temple}) : super(key: key);

  late CameraPosition initialCameraPosition;

  late LatLng latLng;

  late GoogleMapController googleMapController;

  final Set<Marker> markers = {};

  late WidgetRef _ref;

  String funabashi = '35.7102009,139.9490672';
  String zenpukuji = '35.7185071,139.5869534';

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _ref = ref;

    final appValueState = ref.watch(appValueProvider);

    final polylineState = ref.watch(polylineProvider(
      PolylineParamState(
        origin: (appValueState.isZenpukuji) ? zenpukuji : funabashi,
        destination: '${temple.lat},${temple.lng}',
        apikey: 'AIzaSyD9PkTM1Pur3YzmO-v4VzS0r8ZZ0jRJTIU',
      ),
    ));

    var dist = [polylineState.distance];
    (appValueState.isZenpukuji)
        ? dist.add('（from 善福寺）')
        : dist.add('（from 船橋）');

    final date = temple.date.toString().split(' ')[0];

    setMapParam();

    Size size = MediaQuery.of(context).size;

    return DefaultLayout(
      title: '',
      isTitleDisplay: false,
      widget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(temple.temple),
              Text(temple.gohonzon),
              if (temple.memo != '')
                Text(
                  'with.${temple.memo}',
                  style: TextStyle(color: Colors.grey),
                ),
            ],
          ),

          Container(
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(color: Colors.red[900]),
          ),

          //------------------------------// Map
          SizedBox(
            height: (appValueState.isLargeMap) ? (size.height - 350) : 220,
            child: GoogleMap(
              mapType: (appValueState.isDefaultmap)
                  ? MapType.satellite
                  : MapType.normal,
              onMapCreated: (controller) => googleMapController = controller,
              markers: markers,
              initialCameraPosition: initialCameraPosition,
              polylines: {
                if (appValueState.isPolylineDisp)
                  Polyline(
                    polylineId: const PolylineId('overview_polyline'),
                    color: Colors.redAccent,
                    width: 5,
                    points: polylineState.polylinePoints
                        .map((e) => LatLng(e.latitude, e.longitude))
                        .toList(),
                  ),
              },
            ),
          ),
          //------------------------------// Map

          const SizedBox(height: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(temple.address),
              Text(temple.station),
              Text((polylineState.distance != '') ? dist.join() : '-'),
            ],
          ),

          Container(
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(color: Colors.red[900]),
          ),

          makeButtonLine(),
        ],
      ),
    );
  }

  ///
  Widget makeButtonLine() {
    final appValueState = _ref.watch(appValueProvider);

    return Row(
      children: [
        IconButton(
          onPressed: () {
            _ref
                .watch(appValueProvider.notifier)
                .setEnlarge(value: (appValueState.isLargeMap) ? false : true);

            backFlagPosition();
          },
          icon: const Icon(Icons.center_focus_strong, color: Colors.red),
        ),
        IconButton(
          onPressed: () {
            _ref
                .watch(appValueProvider.notifier)
                .setMapType(value: (appValueState.isDefaultmap) ? false : true);
          },
          icon: const Icon(Icons.square_foot_outlined, color: Colors.red),
        ),
        IconButton(
          onPressed: () {
            _ref.watch(appValueProvider.notifier).setDispPolyline(
                value: (appValueState.isPolylineDisp) ? false : true);
          },
          icon: const Icon(Icons.stacked_line_chart, color: Colors.red),
        ),
        IconButton(
          onPressed: () => backFlagPosition(),
          icon: const Icon(Icons.flag, color: Colors.red),
        ),
        IconButton(
          onPressed: () {
            _ref.watch(appValueProvider.notifier).setZenpukuji(
                value: (appValueState.isZenpukuji) ? false : true);
          },
          icon: const Icon(Icons.home_filled, color: Colors.red),
        ),
      ],
    );
  }

  ///
  void setMapParam() {
    final templeLatLngState = _ref.watch(templeLatLngProvider);

    final appValueState = _ref.watch(appValueProvider);

    final exOrigin = (appValueState.isZenpukuji)
        ? zenpukuji.split(',')
        : funabashi.split(',');

    markers.add(
      Marker(
        markerId: const MarkerId('origin'),
        position: LatLng(double.parse(exOrigin[0]), double.parse(exOrigin[1])),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );

    latLng = LatLng(double.parse(temple.lat), double.parse(temple.lng));

    markers.add(
      Marker(
        markerId: const MarkerId('distination'),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(title: temple.temple, snippet: temple.address),
      ),
    );

    if (temple.memo != '') {
      final exMemo = temple.memo.split('、');

      for (var i = 0; i < exMemo.length; i++) {
        if (templeLatLngState[exMemo[i]] != null) {
          markers.add(
            Marker(
              markerId: MarkerId('memo$i'),
              position: LatLng(
                double.parse(templeLatLngState[exMemo[i]]!['lat']!),
                double.parse(templeLatLngState[exMemo[i]]!['lng']!),
              ),
              infoWindow: InfoWindow(
                title: exMemo[i],
                snippet: templeLatLngState[exMemo[i]]!['address'],
              ),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueRose,
              ),
            ),
          );
        }
      }
    }

    ///
    initialCameraPosition = CameraPosition(target: latLng, zoom: 15, tilt: 50);
  }

  ///
  void backFlagPosition() {
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        initialCameraPosition,
      ),
    );
  }
}
