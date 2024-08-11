class LocationData {
  String? countryName;
  String? stateName;
  String? cityName;
}

class WeatherReport {
  WeatherReport({required this.weather,required this.location, this.icon, this.description});

  String weather;
  String location;
  String? icon;
  String? description;
}
