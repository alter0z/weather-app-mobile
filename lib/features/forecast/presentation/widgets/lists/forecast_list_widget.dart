import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_mobile/core/utils/date_time.dart';

class ForecastListWidget extends StatelessWidget {
  final double temp;
  final String icon;
  final String time;
  const ForecastListWidget({super.key, required this.temp, required this.icon, required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Text(
              AppDateTime.getTime(time),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
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
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        )
    );
  }
}
