import 'package:weather_mobile/features/forecast/data/models/weather.dart';
import 'package:weather_mobile/features/forecast/data/models/weather_coord.dart';
import 'package:weather_mobile/features/forecast/data/models/weather_main.dart';
import 'package:weather_mobile/features/forecast/data/models/weather_wind.dart';
import 'package:weather_mobile/features/forecast/domain/entities/weather_response.dart';

class WeatherResponseModel extends WeatherResponseEntity {
  const WeatherResponseModel({
    super.coord,
    super.weather,
    super.main,
    super.wind,
    super.dt
  });

  factory WeatherResponseModel.fromJson(Map<String, dynamic> map) {
    return WeatherResponseModel(
        coord: map['coord'] != null ? WeatherCoordModel.fromJson(map['coord'] as Map<String, dynamic>) : null,
      weather: (map['weather'] as List<dynamic>?)
          ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      main: map['main'] != null ? MainModel.fromJson(map['main'] as Map<String, dynamic>) : null,
      wind: map['wind'] != null ? WindModel.fromJson(map['wind'] as Map<String, dynamic>) : null,
      dt: map['dt'] ?? 0
    );
  }
}