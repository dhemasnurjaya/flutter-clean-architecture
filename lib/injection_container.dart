import 'package:clean_architecture/core/data/local/config.dart';
import 'package:clean_architecture/core/data/local/theme_mode_config.dart';
import 'package:clean_architecture/core/env.dart';
import 'package:clean_architecture/core/network/network.dart';
import 'package:clean_architecture/core/presentation/theme/theme_mode_cubit.dart';
import 'package:clean_architecture/features/weather/data/data_sources/remote/weather_api_remote_data_source.dart';
import 'package:clean_architecture/features/weather/data/repositories/weather_api_repository_impl.dart';
import 'package:clean_architecture/features/weather/domain/repositories/weather_api_repository.dart';
import 'package:clean_architecture/features/weather/domain/use_cases/get_current_weather.dart';
import 'package:clean_architecture/features/weather/presentation/bloc/current_weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void setup() {
  // env
  getIt.registerSingleton<Env>(EnvImpl());

  // network
  getIt.registerLazySingleton<http.Client>(() => http.Client());
  getIt.registerLazySingleton<Network>(() => NetworkImpl(getIt()));

  // shared preferences
  getIt.registerSingletonAsync<SharedPreferences>(
    () async {
      final prefs = await SharedPreferences.getInstance();
      return prefs;
    },
  );

  // configs
  getIt.registerSingletonWithDependencies<Config<ThemeMode>>(
    () => ThemeModeConfig(sharedPreferences: getIt()),
    dependsOn: [SharedPreferences],
  );

  // data sources
  getIt.registerLazySingleton<WeatherApiRemoteDataSource>(
    () => WeatherApiRemoteDataSourceImpl(
      env: getIt(),
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
  getIt.registerSingletonAsync<ThemeModeCubit>(
    () async {
      final initialThemeMode = await getIt<Config<ThemeMode>>().get();
      return ThemeModeCubit(
        themeModeConfig: getIt(),
        initialThemeMode: initialThemeMode,
      );
    },
    dependsOn: [SharedPreferences, Config<ThemeMode>],
  );
  getIt.registerFactory<CurrentWeatherBloc>(
    () => CurrentWeatherBloc(
      getCurrentWeather: getIt(),
    ),
  );

  // others
}
