abstract class WeatherEvent {
  const WeatherEvent();
}

class GetGeo extends WeatherEvent {
  final String city;
  const GetGeo(this.city);
}

class GetCurrentWeather extends WeatherEvent {
  final double lat;
  final double lon;
  const GetCurrentWeather(this.lat, this.lon);
}

class GetForecast extends WeatherEvent {
  final double lat;
  final double lon;
  const GetForecast(this.lat, this.lon);
}