import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/data/models/current_weather_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class WeatherApiRepository {
  Future<Either<Failure, CurrentWeatherModel>> getCurrentWeather(String city);
}
