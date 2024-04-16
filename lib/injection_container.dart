import 'package:clean_architecture/core/network/network.dart';
import 'package:clean_architecture/data/data_sources/remote/weather_api_remote_source.dart';
import 'package:clean_architecture/data/repositories/weather_api_repository_impl.dart';
import 'package:clean_architecture/domain/repositories/weather_api_repository.dart';
import 'package:clean_architecture/domain/use_cases/get_current_weather.dart';
import 'package:clean_architecture/presentation/current_weather/blocs/current_weather_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  // network
  getIt.registerLazySingleton<Network>(() => NetworkImpl());

  // data sources
  getIt.registerLazySingleton<WeatherApiRemoteSource>(
    () => WeatherApiRemoteSourceImpl(
      network: getIt(),
    ),
  );

  // repositories
  getIt.registerLazySingleton<WeatherApiRepository>(
    () => WeatherApiRepositoryImpl(
      weatherApiRemoteSource: getIt(),
    ),
  );

  // use cases
  getIt.registerLazySingleton<GetCurrentWeather>(
    () => GetCurrentWeather(
      weatherApiRepository: getIt(),
    ),
  );

  // blocs
  getIt.registerFactory<CurrentWeatherBloc>(
    () => CurrentWeatherBloc(
      getCurrentWeather: getIt(),
    ),
  );

  // others
}
