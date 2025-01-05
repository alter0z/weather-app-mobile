import 'dart:io';
import 'package:dio/dio.dart';
import 'package:weather_mobile/features/forecast/data/apis/region_api_service.dart';
import 'package:weather_mobile/features/forecast/data/models/city.dart';
import 'package:weather_mobile/features/forecast/data/models/province.dart';
import 'package:weather_mobile/features/forecast/domain/repositories/region.dart';
import '../../../../core/resources/data/data_state.dart';

class RegionRepositoryImpl implements RegionRepository {
  final RegionApiService _regionApiService;
  final String? _key;
  RegionRepositoryImpl(this._regionApiService, {String? key}): _key = key;

  @override
  Future<DataState<List<ProvinceModel>>> getProvinces() async {
    try {
      final provinces = await _regionApiService.getProvinces(key: _key);

      if (provinces.response.statusCode == HttpStatus.ok) {
        return DataSuccess(provinces.data);
      } else {
        return DataFailed(
            DioException(
                error: provinces.response.statusMessage,
                response: provinces.response,
                type: DioExceptionType.cancel,
                requestOptions: provinces.response.requestOptions
            )
        );
      }
    } on DioException catch(e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<List<CityModel>>> getCities(String id) async {
    try {
      final cities = await _regionApiService.getCities(key: _key, id: id);

      if (cities.response.statusCode == HttpStatus.ok) {
        return DataSuccess(cities.data);
      } else {
        return DataFailed(
            DioException(
                error: cities.response.statusMessage,
                response: cities.response,
                type: DioExceptionType.cancel,
                requestOptions: cities.response.requestOptions
            )
        );
      }
    } on DioException catch(e) {
      return DataFailed(e);
    }
  }
}