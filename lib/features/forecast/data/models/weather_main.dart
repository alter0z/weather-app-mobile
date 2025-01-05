import 'package:weather_mobile/features/forecast/domain/entities/weather_main.dart';

class MainModel extends MainEntity {
  const MainModel({
    super.feelsLike,
    super.humidity,
    super.pressure,
    super.temp
  });

  factory MainModel.fromJson(Map<String, dynamic> map) {
    return MainModel(
      temp: (map['temp'] ?? 0).toDouble(),
      feelsLike: (map['feels_like'] ?? 0).toDouble(),
      pressure: map['pressure'] ?? 0,
      humidity: map['humidity'] ?? 0,
    );
  }
}