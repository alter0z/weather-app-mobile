import 'dart:io';
import 'package:dio/dio.dart';
import 'package:weather_mobile/features/forecast/data/models/geo.dart';
import 'package:weather_mobile/features/forecast/data/models/weather_response.dart';
import 'package:weather_mobile/features/forecast/domain/repositories/weather.dart';
import '../../../../core/resources/data/data_state.dart';
import '../apis/weather_api_service.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService _weatherApiService;
  final String? _key;
  WeatherRepositoryImpl(this._weatherApiService, {String? key}): _key = key;

  @override
  Future<DataState<List<GeoModel>>> getGeo(String city) async {
    try {
      final geo = await _weatherApiService.getGeo(key: _key, city: city);

      if (geo.response.statusCode == HttpStatus.ok) {
        return DataSuccess(geo.data);
      } else {
        return DataFailed(
            DioException(
                error: geo.response.statusMessage,
                response: geo.response,
                type: DioExceptionType.cancel,
                requestOptions: geo.response.requestOptions
            )
        );
      }
    } on DioException catch(e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<WeatherResponseModel>> getCurrentWeather(double lat, double lon) async {
    try {
      final weather = await _weatherApiService.getCurrentWeather(key: _key, units: "metric", lat: lat, lon: lon);

      if (weather.response.statusCode == HttpStatus.ok) {
        return DataSuccess(weather.data);
      } else {
        return DataFailed(
            DioException(
                error: weather.response.statusMessage,
                response: weather.response,
                type: DioExceptionType.cancel,
                requestOptions: weather.response.requestOptions
            )
        );
      }
    } on DioException catch(e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<WeatherResponseModel>>> getForecast(double lat, double lon) async {
    try {
      final forecast = await _weatherApiService.getForecast(key: _key, units: "metric", lat: lat, lon: lon);

      if (forecast.response.statusCode == HttpStatus.ok) {
        return DataSuccess(forecast.data);
      } else {
        return DataFailed(
            DioException(
                error: forecast.response.statusMessage,
                response: forecast.response,
                type: DioExceptionType.cancel,
                requestOptions: forecast.response.requestOptions
            )
        );
      }
    } on DioException catch(e) {
      return DataFailed(e);
    }
  }
}