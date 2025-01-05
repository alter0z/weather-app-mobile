import 'package:weather_mobile/features/forecast/data/models/weather_response.dart';
import 'package:weather_mobile/features/forecast/domain/repositories/weather.dart';
import '../../../../core/resources/data/data_state.dart';
import '../../../../core/usecases/usecase.dart';

class GetWeatherUseCase implements UseCaseWithParams<double, double, DataState<WeatherResponseModel>, void> {
  final WeatherRepository _repo;
  GetWeatherUseCase(this._repo);

  @override
  Future<DataState<WeatherResponseModel>> call(double lat, double lon, {void params}) {
    return _repo.getCurrentWeather(lat, lon);
  }
}