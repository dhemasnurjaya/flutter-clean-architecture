import 'package:clean_architecture/core/data/remote/model/weather_api_response_model.dart';
import 'package:clean_architecture/core/error/failure.dart';
import 'package:clean_architecture/data/models/current_weather_model.dart';
import 'package:clean_architecture/domain/repositories/weather_api_repository.dart';
import 'package:clean_architecture/domain/use_cases/get_current_weather.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_current_weather_test.mocks.dart';

@GenerateMocks([WeatherApiRepository])
void main() {
  late GetCurrentWeather useCase;
  late MockWeatherApiRepository weatherApiRepository;

  setUp(() {
    weatherApiRepository = MockWeatherApiRepository();
    useCase = GetCurrentWeather(weatherApiRepository: weatherApiRepository);
  });

  test('should call getCurrentWeather from WeatherApiRepository', () async {
    // Arrange
    const tCity = 'London';
    const tParams = GetCurrentWeatherParams(city: tCity);
    final tCurrentWeatherModel = CurrentWeatherModel(
      location: const WeatherApiLocationModel(
        name: 'London',
        region: 'City of London, Greater London',
        country: 'United Kingdom',
      ),
      data: WeatherApiDataModel(
        lastUpdated: DateTime.now(),
        tempC: 4.0,
        condition: const WeatherApiConditionModel(
          text: 'Sunny',
          icon: '//cdn.weatherapi.com/weather/64x64/day/113.png',
        ),
        windKph: 9.4,
        windDir: 'W',
        precipMm: 0.0,
        humidity: 81,
        cloud: 0,
      ),
      error: null,
    );

    provideDummy<Either<Failure, CurrentWeatherModel>>(
        right(tCurrentWeatherModel));
    when(weatherApiRepository.getCurrentWeather(tCity))
        .thenAnswer((_) async => right(tCurrentWeatherModel));

    // Act
    final result = await useCase.execute(tParams);

    // Assert
    expect(result, isA<Right<Failure, CurrentWeatherModel>>());
    expect(result.isRight(), true);
    verify(weatherApiRepository.getCurrentWeather(tCity));
    verifyNoMoreInteractions(weatherApiRepository);
  });
}
