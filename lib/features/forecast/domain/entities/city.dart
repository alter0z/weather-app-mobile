import 'package:equatable/equatable.dart';

class CityEntity extends Equatable {
  final String? name;

  const CityEntity({
    this.name,
  });

  @override
  List<Object?> get props {
    return [name];
  }
}