import 'package:weather_mobile/features/forecast/domain/entities/city.dart';

class CityModel extends CityEntity {
  const CityModel({
    super.name,
  });

  factory CityModel.fromJson(Map<String, dynamic> map) {
    return CityModel(
      name: map['name'] ?? ""
    );
  }
}