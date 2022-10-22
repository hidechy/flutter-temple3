// ignore_for_file: avoid_dynamic_calls, inference_failure_on_untyped_parameter

import 'latlng.dart';

class Name {
  Name({
    required this.year,
    required this.month,
    required this.day,
    required this.data,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        year: json['year'].toString(),
        month: json['month'].toString(),
        day: json['day'].toString(),
        data: List<LatLng>.from(
            json['data'].map((x) => LatLng.fromJson(x as Map<String, dynamic>))
                as Iterable),
      );

  String year;
  String month;
  String day;
  List<LatLng> data;

  Map<String, dynamic> toJson() => {
        'year': year,
        'month': month,
        'day': day,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
