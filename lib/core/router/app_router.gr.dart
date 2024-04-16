// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CurrentWeatherRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CurrentWeatherPage(),
      );
    }
  };
}

/// generated route for
/// [CurrentWeatherPage]
class CurrentWeatherRoute extends PageRouteInfo<void> {
  const CurrentWeatherRoute({List<PageRouteInfo>? children})
      : super(
          CurrentWeatherRoute.name,
          initialChildren: children,
        );

  static const String name = 'CurrentWeatherRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
