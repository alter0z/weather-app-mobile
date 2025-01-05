import 'package:weather_mobile/features/forecast/domain/entities/weather.dart';

class WeatherModel extends WeatherEntity {
  const WeatherModel({
    super.description,
    super.icon,
    super.main
  });

  factory WeatherModel.fromJson(Map<String, dynamic> map) {
    return WeatherModel(
      main: map['main'] ?? "",
      description: map['description'] ?? "",
      icon: map['icon'] ?? "",
    );
  }
}