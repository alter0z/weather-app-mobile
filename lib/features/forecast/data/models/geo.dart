import 'package:weather_mobile/features/forecast/domain/entities/geo.dart';

class GeoModel extends GeoEntity {
  const GeoModel({
    super.lat,
    super.lon
  });

  factory GeoModel.fromJson(Map<String, dynamic> map) {
    return GeoModel(
      lat: map['lat'] ?? "",
      lon: map['lon'] ?? "",
    );
  }
}