import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/resources/theme/colors.dart';
import '../../../../../core/utils/date_time.dart';

class WeatherWidget extends StatelessWidget {
  final String name;
  final double temp;
  final String desc;
  final String icon;
  final int humidity;
  final int pressure;
  final double feelsLike;
  final double wind;
  // final Widget forecast;
  const WeatherWidget({super.key, required this.temp, required this.desc, required this.icon, required this.name, required this.humidity, required this.pressure, required this.feelsLike, required this.wind});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10,),
                Text(
                  '${AppDateTime.getTimeOfDayGreeting()}, $name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      temp.toInt().toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 120,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -36),
                      child: Text(
                        '°C',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                CachedNetworkImage(
                  imageUrl: 'http://openweathermap.org/img/w/$icon.png',
                  imageBuilder: (context, imageProvide) => ClipRRect(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: imageProvide, fit: BoxFit.cover)
                      ),
                    ),
                  ),
                  progressIndicatorBuilder: (context, url, downloadProgress) => ClipRRect(
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: CupertinoActivityIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => ClipRRect(
                    child: SizedBox(
                      width: 120,
                      height: 120,
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
                Text(
                  desc,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ],
        ),
        Text(
          AppDateTime.formatDateNow(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10,),
        Card(
            elevation: 0,
            color: AppColors.blackOpacity,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 16, end: 16, top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/humidity.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '$humidity %',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'Humidity',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/pressure.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '$pressure hPa',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'Pressure',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: 'http://openweathermap.org/img/w/$icon.png',
                        imageBuilder: (context, imageProvide) => ClipRRect(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: imageProvide, fit: BoxFit.cover)
                            ),
                          ),
                        ),
                        progressIndicatorBuilder: (context, url, downloadProgress) => ClipRRect(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CupertinoActivityIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => ClipRRect(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                      Text(
                        '$temp °C',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Feels Like',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/storm.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '$wind m/s',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Text(
                        'Wind',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
        ),
      ],
    );
  }
}
