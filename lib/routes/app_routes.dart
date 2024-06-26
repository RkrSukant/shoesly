import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_shoesly/routes/route_paths.dart';

import 'app_routes.gr.dart';

final appRouterProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {

  @override
  RouteType get defaultRouteType =>
      const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      initial: true,
      path:RoutePaths.splashScreen,
      page:SplashRoute.page
    ),
    AutoRoute(
        path:RoutePaths.discoverScreen,
        page:DiscoverRoute.page
    ),
    AutoRoute(
        path:RoutePaths.internetErrorScreen,
        page:InternetErrorRoute.page
    ),
    AutoRoute(
        path:RoutePaths.productDetail,
        page:ProductDetailRoute.page
    ),
  ];
}
