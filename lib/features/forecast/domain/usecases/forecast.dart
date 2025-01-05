import 'package:weather_mobile/features/forecast/data/models/weather_response.dart';
import 'package:weather_mobile/features/forecast/domain/repositories/weather.dart';
import '../../../../core/resources/data/data_state.dart';
import '../../../../core/usecases/usecase.dart';

class GetForecastUseCase implements UseCaseWithParams<double, double, DataState<List<WeatherResponseModel>>, void> {
  final WeatherRepository _repo;
  GetForecastUseCase(this._repo);

  @override
  Future<DataState<List<WeatherResponseModel>>> call(double lat, double lon, {void params}) {
    return _repo.getForecast(lat, lon);
  }
}