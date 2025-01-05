import 'package:weather_mobile/features/forecast/domain/entities/province.dart';

class ProvinceModel extends ProvinceEntity {
  const ProvinceModel({
    super.id,
    super.name,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> map) {
    return ProvinceModel(
      id: map['id'] ?? "",
      name: map['name'] ?? ""
    );
  }
}