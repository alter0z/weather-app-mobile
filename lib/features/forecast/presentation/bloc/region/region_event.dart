abstract class RegionEvent {
  const RegionEvent();
}

class GetProvinces extends RegionEvent {
  const GetProvinces();
}

class GetCities extends RegionEvent {
  final String id;
  const GetCities(this.id);
}