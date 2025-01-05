import 'package:flutter/material.dart';

class ForecastListWidget extends StatelessWidget {
  const ForecastListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Text(
              '19°C',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(Icons.cloud, size: 50, color: Colors.white,),
            Text(
              'Cloudy',
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
