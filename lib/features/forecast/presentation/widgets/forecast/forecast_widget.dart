import 'package:flutter/material.dart';
import 'package:weather_mobile/core/utils/date_time.dart';
import 'package:weather_mobile/features/forecast/data/models/weather_response.dart';
import '../../../../../core/resources/theme/colors.dart';
import '../lists/forecast_list_widget.dart';

class ForecastWidget extends StatelessWidget {
  final List<List<WeatherResponseModel>> data;
  const ForecastWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: AppColors.blackOpacity,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
            padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppDateTime.getDate(data[0][0].dtTxt ?? ""),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data[0].length,
                    itemBuilder: (context, index) {
                      return ForecastListWidget(
                        temp: data[0][index].main?.temp ?? 0,
                        icon: data[0][index].weather?[0].icon ?? "",
                        time: data[0][index].dtTxt ?? "",
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  AppDateTime.getDate(data[1][0].dtTxt ?? ""),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data[1].length,
                    itemBuilder: (context, index) {
                      return ForecastListWidget(
                        temp: data[1][index].main?.temp ?? 0,
                        icon: data[1][index].weather?[0].icon ?? "",
                        time: data[1][index].dtTxt ?? "",
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  AppDateTime.getDate(data[2][0].dtTxt ?? ""),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data[2].length,
                    itemBuilder: (context, index) {
                      return ForecastListWidget(
                        temp: data[2][index].main?.temp ?? 0,
                        icon: data[2][index].weather?[0].icon ?? "",
                        time: data[2][index].dtTxt ?? "",
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  AppDateTime.getDate(data[3][0].dtTxt ?? ""),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data[3].length,
                    itemBuilder: (context, index) {
                      return ForecastListWidget(
                        temp: data[3][index].main?.temp ?? 0,
                        icon: data[3][index].weather?[0].icon ?? "",
                        time: data[3][index].dtTxt ?? "",
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  AppDateTime.getDate(data[4][0].dtTxt ?? ""),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data[4].length,
                    itemBuilder: (context, index) {
                      return ForecastListWidget(
                        temp: data[4][index].main?.temp ?? 0,
                        icon: data[4][index].weather?[0].icon ?? "",
                        time: data[4][index].dtTxt ?? "",
                      );
                    },
                  ),
                ),
              ],
            )
        )
    );
  }
}
