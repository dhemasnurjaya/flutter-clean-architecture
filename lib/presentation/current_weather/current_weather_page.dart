import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture/presentation/current_weather/blocs/current_weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({super.key});

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  final _cityTextCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Weather'),
      ),
      body: BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
        builder: (context, state) {
          return ListView(
            children: [
              TextField(
                controller: _cityTextCtl,
                decoration: const InputDecoration(
                  label: Text('City'),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Get Weather'),
              ),
              _buildWeather(state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWeather(CurrentWeatherState state) {
    if (state is CurrentWeatherLoadedState) {
      return Column(
        children: [
          Text(state.currentWeather.conditionIcon),
          Text(state.currentWeather.conditionText),
          Text(state.currentWeather.tempC.toString()),
          Text(state.currentWeather.windKph.toString()),
          Text(state.currentWeather.precipMm.toString()),
          Text(state.currentWeather.humidity.toString()),
          Text(state.currentWeather.cloud.toString()),
          Text(state.currentWeather.locationName ?? ''),
          Text(state.currentWeather.locationRegion ?? ''),
          Text(state.currentWeather.locationCountry ?? ''),
        ],
      );
    } else {
      return const CircularProgressIndicator();
    }
  }
}
