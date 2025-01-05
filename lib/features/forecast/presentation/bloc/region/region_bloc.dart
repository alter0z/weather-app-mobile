import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/city.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/province.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/region/region_event.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/region/region_state.dart';
import '../../../../../core/resources/data/data_state.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  final GetProvinceUseCase _provinceUseCase;
  final GetCityUseCase _cityUseCase;
  RegionBloc(this._provinceUseCase, this._cityUseCase) : super(ProvinceLoading()) {
    on<GetProvinces>(onGetProvinces);
    on<GetCities>(onGetCities);
  }

  void onGetProvinces(GetProvinces event, Emitter<RegionState> emit) async {
    emit(ProvinceLoading());
    final dataState = await _provinceUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ProvinceDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ProvinceError(dataState.error!));
    }
  }

  void onGetCities(GetCities event, Emitter<RegionState> emit) async {
    emit(CityLoading());
    final dataState = await _cityUseCase(event.id);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(CityDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(CityError(dataState.error!));
    }
  }
}