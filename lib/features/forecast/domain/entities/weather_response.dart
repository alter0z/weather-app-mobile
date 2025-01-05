import 'package:equatable/equatable.dart';
import 'package:weather_mobile/features/forecast/domain/entities/weather_coord.dart';
import 'package:weather_mobile/features/forecast/domain/entities/weather_main.dart';
import 'package:weather_mobile/features/forecast/domain/entities/weather_wind.dart';
import 'package:weather_mobile/features/forecast/domain/entities/weather.dart';

class WeatherResponseEntity extends Equatable {
  final WeatherCoordEntity? coord;
  final List<WeatherEntity>? weather;
  final MainEntity? main;
  final WindEntity? wind;
  final int? dt;
  final String? dtTxt;

  const WeatherResponseEntity({
    this.coord,
    this.weather,
    this.main,
    this.wind,
    this.dt,
    this.dtTxt
  });

  @override
  List<Object?> get props {
    return [coord, weather, main, wind, dt, dtTxt];
  }
}