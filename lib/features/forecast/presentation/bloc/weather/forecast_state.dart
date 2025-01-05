import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_mobile/features/forecast/data/models/weather_response.dart';

abstract class ForecastState extends Equatable {
  @override
  List<Object> get props => [];
}

class ForecastLoading extends ForecastState {}

class ForecastDone extends ForecastState {
  final List<WeatherResponseModel> forecast;

  ForecastDone(this.forecast);

  @override
  List<Object> get props => [forecast];
}

class ForecastError extends ForecastState {
  final DioException error;

  ForecastError(this.error);

  @override
  List<Object> get props => [error];
}