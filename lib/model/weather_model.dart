class LocationModel {
  final String name;
  final String region;
  final String country;
  final double latitude;
  final double longitude;
  final String timezoneId;
  final int localtimeEpoch;
  final String localtime;

  LocationModel({
    required this.name,
    required this.region,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.timezoneId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      latitude: json['lat'],
      longitude: json['lon'],
      timezoneId: json['tz_id'],
      localtimeEpoch: json['localtime_epoch'],
      localtime: json['localtime'],
    );
  }
}

class WeatherModel {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double temperatureCelsius;
  final double temperatureFahrenheit;
  final bool isDay;
  final WeatherConditionModel condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDirection;
  final double pressureMb;
  final double pressureIn;
  final double precipitationMm;
  final double precipitationIn;
  final int humidity;
  final int cloud;
  final double feelsLikeCelsius;
  final double feelsLikeFahrenheit;
  final double visibilityKm;
  final double visibilityMiles;
  final double uv;
  final double gustMph;
  final double gustKph;

  WeatherModel({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.temperatureCelsius,
    required this.temperatureFahrenheit,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDirection,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipitationMm,
    required this.precipitationIn,
    required this.humidity,
    required this.cloud,
    required this.feelsLikeCelsius,
    required this.feelsLikeFahrenheit,
    required this.visibilityKm,
    required this.visibilityMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      lastUpdatedEpoch: json['last_updated_epoch'],
      lastUpdated: json['last_updated'],
      temperatureCelsius: json['temp_c'],
      temperatureFahrenheit: json['temp_f'],
      isDay: json['is_day'] == 1,
      condition: WeatherConditionModel.fromJson(json['condition']),
      windMph: json['wind_mph'],
      windKph: json['wind_kph'],
      windDegree: json['wind_degree'],
      windDirection: json['wind_dir'],
      pressureMb: json['pressure_mb'],
      pressureIn: json['pressure_in'],
      precipitationMm: json['precip_mm'],
      precipitationIn: json['precip_in'],
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelsLikeCelsius: json['feelslike_c'],
      feelsLikeFahrenheit: json['feelslike_f'],
      visibilityKm: json['vis_km'],
      visibilityMiles: json['vis_miles'],
      uv: json['uv'],
      gustMph: json['gust_mph'],
      gustKph: json['gust_kph'],
    );
  }
}

class WeatherConditionModel {
  final String text;
  final String icon;
  final int code;

  WeatherConditionModel({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory WeatherConditionModel.fromJson(Map<String, dynamic> json) {
    return WeatherConditionModel(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }
}
