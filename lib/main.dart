import 'package:clean_architecture/core/presentation/bloc/app_bloc_observer.dart';
import 'package:clean_architecture/core/presentation/theme/app_theme.dart';
import 'package:clean_architecture/core/presentation/theme/theme_mode_cubit.dart';
import 'package:clean_architecture/core/router/app_router.dart';
import 'package:clean_architecture/features/weather/presentation/bloc/current_weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as ic;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // dependency injection setup
  ic.setup();
  await ic.getIt.allReady();

  // register bloc observer
  Bloc.observer = AppBlocObserver();

  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeModeCubit>(
          create: (context) => ic.getIt(),
        ),
        BlocProvider<CurrentWeatherBloc>(
          create: (context) => ic.getIt(),
        ),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Weather App',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state,
            routerConfig: _appRouter.config(),
          );
        },
      ),
    );
  }
}
