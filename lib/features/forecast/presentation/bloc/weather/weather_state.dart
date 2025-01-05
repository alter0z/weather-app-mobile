import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_mobile/features/forecast/data/models/weather_response.dart';
import 'package:weather_mobile/features/forecast/domain/entities/geo.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class GeoLoading extends WeatherState {}

class GeoDone extends WeatherState {
  final List<GeoEntity> geo;

  GeoDone(this.geo);

  @override
  List<Object> get props => [geo];
}

class GeoError extends WeatherState {
  final DioException error;

  GeoError(this.error);

  @override
  List<Object> get props => [error];
}

class WeatherLoading extends WeatherState {}

class WeatherDone extends WeatherState {
  final WeatherResponseModel weather;

  WeatherDone(this.weather);

  @override
  List<Object> get props => [weather];
}

class WeatherError extends WeatherState {
  final DioException error;

  WeatherError(this.error);

  @override
  List<Object> get props => [error];
}

class ForecastLoading extends WeatherState {}

class ForecastDone extends WeatherState {
  final List<WeatherResponseModel> forecast;

  ForecastDone(this.forecast);

  @override
  List<Object> get props => [forecast];
}

class ForecastError extends WeatherState {
  final DioException error;

  ForecastError(this.error);

  @override
  List<Object> get props => [error];
}