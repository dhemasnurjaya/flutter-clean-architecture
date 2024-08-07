import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: CurrentWeatherRoute.page,
          initial: true,
        ),
        AutoRoute(page: AppSettingsRoute.page),
      ];
}
