import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_mobile/features/forecast/data/models/city.dart';
import 'package:weather_mobile/features/forecast/data/models/province.dart';
part 'region_api_service.g.dart';

@RestApi()
abstract class RegionApiService {
  factory RegionApiService(Dio dio, {String? baseUrl}) {
    return _RegionApiService(dio, baseUrl: baseUrl);
  }
  @GET('provinsi')
  Future<HttpResponse<List<ProvinceModel>>> getProvinces({
    @Query("api_key") String? key
  });

  @GET('kabupaten')
  Future<HttpResponse<List<CityModel>>> getCities({
    @Query("api_key") String? key,
    @Query("Id_provinsi") String? id,
  });
}