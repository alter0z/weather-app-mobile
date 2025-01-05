import 'package:weather_mobile/features/forecast/domain/entities/province.dart';
import 'package:weather_mobile/features/forecast/domain/repositories/region.dart';
import '../../../../core/resources/data/data_state.dart';
import '../../../../core/usecases/usecase.dart';

class GetProvinceUseCase implements UseCase<DataState<List<ProvinceEntity>>, void> {
  final RegionRepository _repo;
  GetProvinceUseCase(this._repo);

  @override
  Future<DataState<List<ProvinceEntity>>> call({void params}) {
    return _repo.getProvinces();
  }
}