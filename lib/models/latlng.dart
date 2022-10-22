class LatLng {
  LatLng({
    required this.temple,
    required this.address,
    required this.lat,
    required this.lng,
  });

  String temple;
  String address;
  String lat;
  String lng;

  factory LatLng.fromJson(Map<String, dynamic> json) => LatLng(
        temple: json["temple"],
        address: json["address"],
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "temple": temple,
        "address": address,
        "lat": lat,
        "lng": lng,
      };
}
