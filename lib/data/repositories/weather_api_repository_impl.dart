import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/core/error/server_failure.dart';
import 'package:clean_architecture/data/data_sources/remote/weather_api_remote_source.dart';
import 'package:clean_architecture/data/models/current_weather_model.dart';
import 'package:clean_architecture/domain/repositories/weather_api_repository.dart';
import 'package:fpdart/fpdart.dart';

class WeatherApiRepositoryImpl implements WeatherApiRepository {
  final WeatherApiRemoteSource weatherApiRemoteSource;

  WeatherApiRepositoryImpl({required this.weatherApiRemoteSource});

  @override
  Future<Either<Failure, CurrentWeatherModel>> getCurrentWeather(
      String city) async {
    try {
      final result = await weatherApiRemoteSource.getCurrentWeather(city);
      return right(result);
    } on Exception catch (e) {
      return left(ServerFailure(message: e.toString(), cause: e));
    }
  }
}
