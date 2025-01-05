import 'package:weather_mobile/features/forecast/data/models/geo.dart';
import 'package:weather_mobile/features/forecast/data/models/weather_response.dart';

import '../../../../core/resources/data/data_state.dart';

abstract class WeatherRepository {
  Future<DataState<List<GeoModel>>> getGeo(String city);
  Future<DataState<WeatherResponseModel>> getCurrentWeather(double lat, double lon);
  Future<DataState<List<WeatherResponseModel>>> getForecast(double lat, double lon);
}