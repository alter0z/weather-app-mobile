import 'package:weather_mobile/features/forecast/domain/entities/city.dart';
import 'package:weather_mobile/features/forecast/domain/repositories/region.dart';
import '../../../../core/resources/data/data_state.dart';
import '../../../../core/usecases/usecase.dart';

class GetCityUseCase implements UseCaseWithParam<String, DataState<List<CityEntity>>, void> {
  final RegionRepository _repo;
  GetCityUseCase(this._repo);

  @override
  Future<DataState<List<CityEntity>>> call(String id, {void params}) {
    return _repo.getCities(id);
  }
}