import 'package:weather_mobile/features/forecast/domain/entities/weather_wind.dart';

class WindModel extends WindEntity {
  const WindModel({
    super.deg,
    super.gust,
    super.speed
  });

  factory WindModel.fromJson(Map<String, dynamic> map) {
    return WindModel(
      speed: (map['speed'] ?? 0).toDouble(),
      deg: map['deg'] ?? 0,
      gust: (map['gust'] ?? 0).toDouble(),
    );
  }
}