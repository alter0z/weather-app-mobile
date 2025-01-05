import 'package:weather_mobile/features/forecast/domain/entities/weather_coord.dart';

class WeatherCoordModel extends WeatherCoordEntity {
  const WeatherCoordModel({
    super.lat,
    super.lon,
  });

  factory WeatherCoordModel.fromJson(Map<String, dynamic> map) {
    return WeatherCoordModel(
      lat: map['lat'] ?? "",
      lon: map['lon'] ?? "",
    );
  }
}