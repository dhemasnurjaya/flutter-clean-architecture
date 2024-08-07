import 'package:clean_architecture/core/domain/use_case.dart';
import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/features/weather/domain/entities/current_weather.dart';
import 'package:clean_architecture/features/weather/domain/repositories/weather_api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

class GetCurrentWeather
    extends UseCase<CurrentWeather, GetCurrentWeatherParams> {
  final WeatherApiRepository weatherApiRepository;

  GetCurrentWeather({required this.weatherApiRepository});

  @override
  Future<Either<Failure, CurrentWeather>> execute(
    GetCurrentWeatherParams params,
  ) async {
    return weatherApiRepository.getCurrentWeather(params.city);
  }
}

class GetCurrentWeatherParams extends Equatable {
  final String city;

  const GetCurrentWeatherParams({required this.city});

  @override
  List<Object?> get props => [city];
}
