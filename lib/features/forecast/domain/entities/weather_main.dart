import 'package:equatable/equatable.dart';

class MainEntity extends Equatable {
  final double? temp;
  final double? feelsLike;
  final int? pressure;
  final int? humidity;

  const MainEntity({
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
  });

  @override
  List<Object?> get props {
    return [temp, feelsLike, pressure, humidity];
  }
}