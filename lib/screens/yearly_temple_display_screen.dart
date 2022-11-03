// ignore_for_file: must_be_immutable, unnecessary_null_comparison, avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../layouts/default_layout.dart';
import '../viewmodel/app_value_viewmodel.dart';
import '../viewmodel/temple_all_viewmodel.dart';
import '../viewmodel/temple_latlng_viewmodel.dart';

class YearlyTempleDisplayScreen extends ConsumerWidget {
  YearlyTempleDisplayScreen({super.key, required this.year});

  final String year;

  List<Map<String, String>> yearlyTempleList = [];

  late CameraPosition initialCameraPosition;

  late GoogleMapController googleMapController;

  final Set<Marker> markers = {};

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templeLatLngState = ref.watch(templeLatLngProvider);

    final yearlyAllTempleState = ref.watch(yearlyAllTempleProvider(year));

    if (templeLatLngState != null && yearlyAllTempleState != null) {
      makeYearlyLatLngList(
        latlng: templeLatLngState,
        yearlyTemple: yearlyAllTempleState,
      );
    }

    final appValueState = ref.watch(appValueProvider);

    setMapParam();

    final size = MediaQuery.of(context).size;

    return DefaultLayout(
      title: '',
      isTitleDisplay: false,
      widget: Column(
        children: [
          const SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$year (${yearlyTempleList.length})'),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Container(
            height: (appValueState.isYearlyMapSizeLimit)
                ? (size.height * 0.6 - 100)
                : (size.height * 0.8),
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: GoogleMap(
              onMapCreated: (controller) => googleMapController = controller,
              markers: markers,
              initialCameraPosition: initialCameraPosition,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              GestureDetector(
                onTap: () {
                  ref.watch(appValueProvider.notifier).setYearlyMapSizeLimit(
                      value:
                          (appValueState.isYearlyMapSizeLimit) ? false : true);
                },
                child: Icon(
                  (appValueState.isYearlyMapSizeLimit)
                      ? Icons.arrow_circle_down
                      : Icons.arrow_circle_up,
                ),
              ),
            ],
          ),
          if (appValueState.isYearlyMapSizeLimit)
            SizedBox(
              height: size.height * 0.3,
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Text(yearlyTempleList[index]['name']!);
                },
                separatorBuilder: (context, index) => Container(),
                itemCount: yearlyTempleList.length,
              ),
            ),
        ],
      ),
    );
  }

  ///
  void makeYearlyLatLngList(
      {required Map<String, Map<String, String>> latlng,
      required List<String> yearlyTemple}) {
    yearlyTempleList = [];

    for (var i = 0; i < yearlyTemple.length; i++) {
      final map = {...latlng[yearlyTemple[i]]!};
      map['name'] = yearlyTemple[i];
      yearlyTempleList.add(map);
    }
  }

  ///
  void setMapParam() {
    //---------------------------------------------//
    const funabashi = '35.7102009,139.9490672';
    final exFunabashi = funabashi.split(',');
    final latLng =
        LatLng(double.parse(exFunabashi[0]), double.parse(exFunabashi[1]));

    initialCameraPosition = CameraPosition(target: latLng, zoom: 11, tilt: 50);
    //---------------------------------------------//

    for (var i = 0; i < yearlyTempleList.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId('marker$i'),
          position: LatLng(
            double.parse(yearlyTempleList[i]['lat']!),
            double.parse(yearlyTempleList[i]['lng']!),
          ),
          infoWindow: InfoWindow(
            title: yearlyTempleList[i]['name'],
            snippet: yearlyTempleList[i]['address'],
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRose,
          ),
        ),
      );
    }
  }
}
