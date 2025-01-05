import 'package:weather_mobile/features/forecast/domain/entities/geo.dart';
import 'package:weather_mobile/features/forecast/domain/repositories/weather.dart';
import '../../../../core/resources/data/data_state.dart';
import '../../../../core/usecases/usecase.dart';

class GetGeoUseCase implements UseCaseWithParam<String, DataState<List<GeoEntity>>, void> {
  final WeatherRepository _repo;
  GetGeoUseCase(this._repo);

  @override
  Future<DataState<List<GeoEntity>>> call(String city, {void params}) {
    return _repo.getGeo(city);
  }
}