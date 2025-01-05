import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_mobile/features/forecast/data/apis/region_api_service.dart';
import 'package:weather_mobile/features/forecast/data/apis/weather_api_service.dart';
import 'package:weather_mobile/features/forecast/data/repositories/region.dart';
import 'package:weather_mobile/features/forecast/data/repositories/weather.dart';
import 'package:weather_mobile/features/forecast/domain/repositories/region.dart';
import 'package:weather_mobile/features/forecast/domain/repositories/weather.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/city.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/forecast.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/geo.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/province.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/weather.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/region/region_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/weather/weather_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // .env
  await dotenv.load(fileName: ".env");
  final String? weatherBaseUrl = dotenv.env['WEATHER_BASE_URL'];
  // final String? weatherForecastEndpoint = dotenv.env['WEATHER_FORECAST_ENDPOINT'];
  // final String? weatherGeoEndpoint = dotenv.env['WEATHER_GEO_ENDPOINT'];
  final String? weatherApiKey = dotenv.env['WEATHER_API_KEY'];
  final String? regionBaseUrl = dotenv.env['REGION_BASE_URL'];
  final String? regionApiKey = dotenv.env['REGION_API_KEY'];
  if (weatherBaseUrl == null ||
      // weatherForecastEndpoint == null ||
      // weatherGeoEndpoint == null ||
      weatherApiKey == null ||
      regionBaseUrl == null ||
      regionApiKey == null) {
    throw Exception('One or more environment variables are missing.');
  }

  // dio
  final dio = Dio();
  dio.interceptors.add(PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ));
  sl.registerSingleton<Dio>(dio);

  // dependencies
  sl.registerSingleton<RegionApiService>(RegionApiService(sl(), baseUrl: regionBaseUrl));
  sl.registerSingleton<WeatherApiService>(WeatherApiService(sl(), baseUrl: weatherBaseUrl));
  sl.registerSingleton<RegionRepository>(RegionRepositoryImpl(sl(), key: regionApiKey));
  sl.registerSingleton<WeatherRepository>(WeatherRepositoryImpl(sl(), key: weatherApiKey));

  // usecases
  sl.registerSingleton<GetProvinceUseCase>(GetProvinceUseCase(sl()));
  sl.registerSingleton<GetCityUseCase>(GetCityUseCase(sl()));
  sl.registerSingleton<GetGeoUseCase>(GetGeoUseCase(sl()));
  sl.registerSingleton<GetWeatherUseCase>(GetWeatherUseCase(sl()));
  sl.registerSingleton<GetForecastUseCase>(GetForecastUseCase(sl()));

  // blocs
  sl.registerFactory<RegionBloc>(
        () => RegionBloc(sl(), sl()),
  );
  sl.registerFactory<WeatherBloc>(
        () => WeatherBloc(sl(), sl(), sl()),
  );
}