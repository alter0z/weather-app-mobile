import 'package:equatable/equatable.dart';

class ProvinceEntity extends Equatable {
  final String? id;
  final String? name;

  const ProvinceEntity({
    this.id,
    this.name,
  });

  @override
  List<Object?> get props {
    return [id, name];
  }
}