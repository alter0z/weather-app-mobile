import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/weather/weather_bloc.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/weather/weather_event.dart';
import 'package:weather_mobile/features/forecast/presentation/bloc/weather/weather_state.dart';
import 'package:weather_mobile/features/forecast/presentation/widgets/forecast/weather_widget.dart';
import '../../../../core/resources/theme/colors.dart';
import '../../../../injection_container.dart';

class WeatherScreen extends StatelessWidget {
  final String cityName;
  final String name;
  const WeatherScreen({super.key, required this.cityName, required this.name});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherBloc>(
      create: (context) => sl()..add(GetGeo(cityName)),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
            padding: const EdgeInsetsDirectional.only(start: 14, end: 14),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.darkBlue, AppColors.blueAttribute],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (blocContext, state) {
                  if (state is GeoLoading) {
                    return Center(
                      child: CupertinoActivityIndicator(
                        radius: 15.0,
                      ),
                    );
                  }
                  if (state is GeoError) {
                    return Center(child: Icon(Icons.refresh));
                  }
                  if (state is GeoDone) {
                    BlocProvider.of<WeatherBloc>(blocContext).add(GetCurrentWeather(state.geo[0].lat ?? 0, state.geo[0].lon ?? 0));
                    return WeatherWidget(name: name, temp: 0, desc: "-", icon: "-", humidity: 0, pressure: 0, feelsLike: 0, wind: 0,);
                  }
                  if (state is WeatherLoading) {
                    return Center(
                      child: CupertinoActivityIndicator(
                        radius: 15.0,
                      ),
                    );
                  }
                  if (state is WeatherError) {
                    return Center(child: Icon(Icons.refresh));
                  }
                  if (state is WeatherDone) {
                    // BlocProvider.of<WeatherBloc>(blocContext).add(GetForecast(state.weather.coord?.lat ?? 0, state.weather.coord?.lon ?? 0));
                    return WeatherWidget(
                      name: name,
                      temp: state.weather.main?.temp ?? 0,
                      desc: state.weather.weather?[0].description ?? "-",
                      icon: state.weather.weather?[0].icon ?? "-",
                      humidity: state.weather.main?.humidity ?? 0,
                      pressure: state.weather.main?.pressure ?? 0,
                      feelsLike: state.weather.main?.feelsLike ?? 0,
                      wind: state.weather.wind?.speed ?? 0,
                    );
                  }
                  // if (state is ForecastLoading) {
                  //   return Center(
                  //     child: CupertinoActivityIndicator(
                  //       radius: 15.0,
                  //     ),
                  //   );
                  // }
                  // if (state is ForecastError) {
                  //   return Center(child: Icon(Icons.refresh));
                  // }
                  // if (state is ForecastDone) {
                  //   return WeatherWidget(name: name, temp: 0, desc: "-", icon: "-", humidity: 0, pressure: 0, feelsLike: 0, wind: 0,);
                  // }
                  return Container();
                }
            )
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.darkBlue,
      foregroundColor: Colors.white,
      title: Text(
        cityName,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600
        ),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded)
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.refresh_rounded),
          onPressed: () {},
        ),
      ],
    );
  }
}
