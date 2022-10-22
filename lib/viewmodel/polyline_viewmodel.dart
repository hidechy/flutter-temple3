import 'dart:convert';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';

import '../state/polyline_param_state.dart';
import '../state/polyline_result_state.dart';

//////////////////////////////////////////////////////

final polylineProvider = StateNotifierProvider.family
    .autoDispose<PolylineNotifier, PolylineResultState, PolylineParamState>(
        (ref, param) {
  return PolylineNotifier(
    PolylineResultState(
      bounds: LatLngBounds(
        southwest: LatLng(0.0, 0.0),
        northeast: LatLng(0.0, 0.0),
      ),
      distance: '',
      duration: '',
      polylinePoints: [],
    ),
  )..getPolyline(param: param);
});

class PolylineNotifier extends StateNotifier<PolylineResultState> {
  PolylineNotifier(super.state);

  Future<void> getPolyline({required PolylineParamState param}) async {
    try {
      String url = 'https://maps.googleapis'
          '.com/maps/api/directions/json?origin=${param.origin}&destination'
          '=${param.destination}&mode=walking&language=ja&key=${param.apikey}';

      final response = await get(Uri.parse(url));

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        final routes = decoded['routes'] as Iterable;
        if (routes.isNotEmpty) {
          final data = decoded['routes'][0];

          final _sw = data['bounds']['southwest'];
          final southwest = LatLng(
            double.parse(_sw['lat'].toString()),
            double.parse(_sw['lng'].toString()),
          );
          final _ne = data['bounds']['northeast'];
          final northeast = LatLng(
            double.parse(_ne['lat'].toString()),
            double.parse(_ne['lng'].toString()),
          );
          LatLngBounds bounds =
              LatLngBounds(southwest: southwest, northeast: northeast);

          String distance = '';
          String duration = '';
          if ((data['legs'] as List).isNotEmpty) {
            final leg = data['legs'][0];
            distance = leg['distance']['text'].toString();
            duration = leg['duration']['text'].toString();
          }

          List<PointLatLng> polylinePoints = PolylinePoints()
              .decodePolyline(data['overview_polyline']['points'].toString());

          state = PolylineResultState(
            bounds: bounds,
            distance: distance,
            duration: duration,
            polylinePoints: polylinePoints,
          );
        }
      }
    } catch (e) {
      throw e.toString();
    }
  }
}

//////////////////////////////////////////////////////
