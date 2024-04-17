import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture/presentation/app_settings/app_settings_page.dart';
import 'package:clean_architecture/presentation/current_weather/current_weather_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: CurrentWeatherRoute.page,
          initial: true,
        ),
        AutoRoute(page: AppSettingsRoute.page),
      ];
}
