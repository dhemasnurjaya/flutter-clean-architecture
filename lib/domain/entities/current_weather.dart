import 'package:clean_architecture/data/models/current_weather_model.dart';

class CurrentWeather {
  final DateTime? lastUpdated;
  final double? tempC;
  final double? windKph;
  final String? windDir;
  final double? precipMm;
  final int? humidity;
  final int? cloud;
  final String? conditionText;
  final String? conditionIcon;
  final String? locationName;
  final String? locationRegion;
  final String? locationCountry;

  const CurrentWeather({
    required this.lastUpdated,
    required this.tempC,
    required this.windKph,
    required this.windDir,
    required this.precipMm,
    required this.humidity,
    required this.cloud,
    required this.conditionText,
    required this.conditionIcon,
    required this.locationName,
    required this.locationRegion,
    required this.locationCountry,
  });

  factory CurrentWeather.fromModel(CurrentWeatherModel model) => CurrentWeather(
        lastUpdated: model.data?.lastUpdated,
        tempC: model.data?.tempC,
        windKph: model.data?.windKph,
        windDir: model.data?.windDir,
        precipMm: model.data?.precipMm,
        humidity: model.data?.humidity,
        cloud: model.data?.cloud,
        conditionText: model.data?.condition.text,
        conditionIcon: model.data?.condition.icon,
        locationName: model.location?.name,
        locationRegion: model.location?.region,
        locationCountry: model.location?.country,
      );
}
