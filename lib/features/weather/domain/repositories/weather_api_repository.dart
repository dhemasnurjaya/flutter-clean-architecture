import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/features/weather/domain/entities/current_weather.dart';
import 'package:fpdart/fpdart.dart';

abstract class WeatherApiRepository {
  Future<Either<Failure, CurrentWeather>> getCurrentWeather(String city);
}
