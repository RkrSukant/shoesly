import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app_routes.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {

  @override
  RouteType get defaultRouteType =>
      const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    // AutoRoute(
    //   initial: true,
    //   path:RoutePaths.splashScreen,
    //   page:SplashRoute.page
    // )
  ];
}
