import 'package:clean_architecture/core/env.dart';
import 'package:clean_architecture/core/network/network.dart';
import 'package:clean_architecture/features/weather/data/data_sources/remote/weather_api_remote_data_source.dart';
import 'package:clean_architecture/features/weather/data/models/current_weather_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../_responses/_response.dart';
import 'weather_api_remote_source_test.mocks.dart';

@GenerateMocks([Env, Network])
void main() {
  late MockEnv mockEnv;
  late MockNetwork mockNetwork;
  late WeatherApiRemoteDataSource weatherApiRemoteSource;

  setUp(() {
    mockEnv = MockEnv();
    mockNetwork = MockNetwork();
    weatherApiRemoteSource = WeatherApiRemoteDataSourceImpl(
      env: mockEnv,
      network: mockNetwork,
    );
  });

  group('getCurrentWeather', () {
    test('should return CurrentWeatherModel when getCurrentWeather is called',
        () async {
      // Arrange
      const tCity = 'London';
      final tResponse = readResponse('current_weather');

      when(mockEnv.weatherApiKey).thenReturn('api_key');
      when(mockEnv.weatherApiHost).thenReturn('api_host');
      when(mockNetwork.get(any)).thenAnswer(
        (_) async => tResponse,
      );

      // Act
      final result = await weatherApiRemoteSource.getCurrentWeather(tCity);

      // Assert
      expect(result, isA<CurrentWeatherModel>());
    });
  });
}
