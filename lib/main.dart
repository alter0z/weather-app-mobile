import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_mobile/features/forecast/presentation/pages/form_screen.dart';
import 'package:weather_mobile/features/forecast/presentation/pages/weather_screen.dart';

import 'injection_container.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: WeatherScreen(cityName: "Bandung", name: "Von Einzbern"),
      home: FormScreen(),
    );
  }
}