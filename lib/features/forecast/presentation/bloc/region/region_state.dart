import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_mobile/features/forecast/domain/entities/city.dart';
import 'package:weather_mobile/features/forecast/domain/entities/province.dart';

abstract class RegionState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProvinceLoading extends RegionState {}

class ProvinceDone extends RegionState {
  final List<ProvinceEntity> provinces;

  ProvinceDone(this.provinces);

  @override
  List<Object> get props => [provinces];
}

class ProvinceError extends RegionState {
  final DioException error;

  ProvinceError(this.error);

  @override
  List<Object> get props => [error];
}

class CityLoading extends RegionState {}

class CityDone extends RegionState {
  final List<CityEntity> cities;

  CityDone(this.cities);

  @override
  List<Object> get props => [cities];
}

class CityError extends RegionState {
  final DioException error;

  CityError(this.error);

  @override
  List<Object> get props => [error];
}