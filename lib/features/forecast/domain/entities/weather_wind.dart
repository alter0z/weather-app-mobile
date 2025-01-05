import 'package:equatable/equatable.dart';

class WindEntity extends Equatable {
  final double? speed;
  final int? deg;
  final double? gust;

  const WindEntity({
    this.speed,
    this.deg,
    this.gust,
  });

  @override
  List<Object?> get props {
    return [speed, deg, gust];
  }
}