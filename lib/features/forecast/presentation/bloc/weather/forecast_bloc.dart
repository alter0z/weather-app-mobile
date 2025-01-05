import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/forecast.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/geo.dart';
import 'package:weather_mobile/features/forecast/domain/usecases/weather.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/weather/forecast_event.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/weather/forecast_state.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/weather/weather_event.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/weather/weather_state.dart';
import '../../../../../core/resources/data/data_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final GetForecastUseCase _getForecastUseCase;
  ForecastBloc(this._getForecastUseCase) : super(ForecastLoading()) {
    on<GetForecast>(onForecast);
  }

  void onForecast(GetForecast event, Emitter<ForecastState> emit) async {
    emit(ForecastLoading());
    final dataState = await _getForecastUseCase(event.lat, event.lon);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ForecastDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(ForecastError(dataState.error!));
    }
  }
}