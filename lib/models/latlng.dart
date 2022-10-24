class LatLng {
  LatLng({
    required this.temple,
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory LatLng.fromJson(Map<String, dynamic> json) => LatLng(
        temple: json['temple'].toString(),
        address: json['address'].toString(),
        lat: json['lat'].toString(),
        lng: json['lng'].toString(),
      );

  String temple;
  String address;
  String lat;
  String lng;

  Map<String, dynamic> toJson() => {
        'temple': temple,
        'address': address,
        'lat': lat,
        'lng': lng,
      };
}
