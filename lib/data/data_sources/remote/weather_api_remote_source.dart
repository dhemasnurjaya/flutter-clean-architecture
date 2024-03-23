import 'dart:convert';

import 'package:clean_architecture/core/data/remote/hosts.dart';
import 'package:clean_architecture/core/network/network.dart';
import 'package:clean_architecture/data/models/current_weather_model.dart';

abstract class WeatherApiRemoteSource {
  Future<CurrentWeatherModel> getCurrentWeather(String city);
}

class WeatherApiRemoteSourceImpl implements WeatherApiRemoteSource {
  final Network network;

  WeatherApiRemoteSourceImpl({required this.network});

  @override
  Future<CurrentWeatherModel> getCurrentWeather(String city) async {
    final uri = Uri(
      scheme: 'https',
      host: weatherApiHost,
      path: 'v1/current.json',
      queryParameters: {
        'key': 'KEY',
        'q': city,
      },
    );
    final response = await network.get(uri);
    final jsonResponse = jsonDecode(response) as Map<String, dynamic>;
    return CurrentWeatherModel.fromJson(jsonResponse);
  }
}
