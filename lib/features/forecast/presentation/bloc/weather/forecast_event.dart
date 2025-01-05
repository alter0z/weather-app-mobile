abstract class ForecastEvent {
  const ForecastEvent();
}

class GetForecast extends ForecastEvent {
  final double lat;
  final double lon;
  const GetForecast(this.lat, this.lon);
}