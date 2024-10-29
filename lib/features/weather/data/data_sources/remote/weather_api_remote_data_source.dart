import 'dart:convert';

import 'package:clean_architecture/core/env.dart';
import 'package:clean_architecture/core/network/network.dart';
import 'package:clean_architecture/features/weather/data/models/current_weather_model.dart';

abstract class WeatherApiRemoteDataSource {
  Future<CurrentWeatherModel> getCurrentWeather(String city);
}

class WeatherApiRemoteDataSourceImpl implements WeatherApiRemoteDataSource {
  final Env env;
  final Network network;

  WeatherApiRemoteDataSourceImpl({
    required this.env,
    required this.network,
  });

  @override
  Future<CurrentWeatherModel> getCurrentWeather(String city) async {
    final uri = Uri(
      scheme: 'https',
      host: env.weatherApiHost,
      path: 'v1/current.json',
      queryParameters: {
        'key': env.weatherApiKey,
        'q': city,
      },
    );
    final response = await network.get(uri);
    final jsonResponse = jsonDecode(response) as Map<String, dynamic>;
    return CurrentWeatherModel.fromJson(jsonResponse);
  }
}
