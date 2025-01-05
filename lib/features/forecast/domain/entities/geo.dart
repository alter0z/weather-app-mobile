import 'package:equatable/equatable.dart';

class GeoEntity extends Equatable {
  final double? lat;
  final double? lon;

  const GeoEntity({
    this.lat,
    this.lon
  });

  @override
  List<Object?> get props {
    return [lat, lon];
  }
}