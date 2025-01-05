import 'package:weather_mobile/features/forecast/domain/entities/city.dart';
import 'package:weather_mobile/features/forecast/domain/entities/province.dart';
import '../../../../core/resources/data/data_state.dart';

abstract class RegionRepository {
  Future<DataState<List<ProvinceEntity>>> getProvinces();
  Future<DataState<List<CityEntity>>> getCities(String id);
}