import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String? main;
  final String? description;
  final String? icon;

  const WeatherEntity({
    this.main,
    this.description,
    this.icon,
  });

  @override
  List<Object?> get props {
    return [main, description, icon];
  }
}