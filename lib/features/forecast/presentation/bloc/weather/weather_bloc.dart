import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/geo.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/weather.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/weather/weather_event.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/weather/weather_state.dart';
import '../../../../../core/resources/data/data_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetGeoUseCase _geoUseCase;
  final GetWeatherUseCase _getWeatherUseCase;
  WeatherBloc(this._geoUseCase, this._getWeatherUseCase) : super(GeoLoading()) {
    on<GetGeo>(onGetGeo);
    on<GetCurrentWeather>(onGetCurrentWeather);
  }

  void onGetGeo(GetGeo event, Emitter<WeatherState> emit) async {
    emit(GeoLoading());
    final dataState = await _geoUseCase(event.city);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(GeoDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(GeoError(dataState.error!));
    }
  }

  void onGetCurrentWeather(GetCurrentWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    final dataState = await _getWeatherUseCase(event.lat, event.lon);

    if (dataState is DataSuccess && dataState.data != null) {
      emit(WeatherDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(WeatherError(dataState.error!));
    }
  }
}