import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_mobile/features/forecast/data/models/geo.dart';
import 'package:weather_mobile/features/forecast/data/models/weather_response.dart';
part 'weather_api_service.g.dart';

@RestApi()
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio, {String? baseUrl}) {
    return _WeatherApiService(dio, baseUrl: baseUrl);
  }
  @GET('geo/1.0/direct')
  Future<HttpResponse<List<GeoModel>>> getGeo({
    @Query("appid") String? key,
    @Query("q") String? city,
  });

  @GET('data/2.5/weather')
  Future<HttpResponse<WeatherResponseModel>> getCurrentWeather({
    @Query("appid") String? key,
    @Query("units") String? units,
    @Query("lat") double? lat,
    @Query("lon") double? lon,
  });

  @GET('data/2.5/forecast')
  Future<HttpResponse<List<WeatherResponseModel>>> getForecast({
    @Query("appid") String? key,
    @Query("units") String? units,
    @Query("lat") double? lat,
    @Query("lon") double? lon,
  });
}