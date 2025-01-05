import 'package:equatable/equatable.dart';

class WeatherCoordEntity extends Equatable {
  final double? lat;
  final double? lon;

  const WeatherCoordEntity({
    this.lat,
    this.lon,
  });

  @override
  List<Object?> get props {
    return [lat, lon];
  }
}