// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:sukant_shoesly/features/discover/presentation/screens/discover_screen.dart'
    as _i1;
import 'package:sukant_shoesly/features/landing/internet_error_screen.dart'
    as _i2;
import 'package:sukant_shoesly/features/landing/splash_screen.dart' as _i4;
import 'package:sukant_shoesly/features/product_detail/presentation/screens/product_detail_screen.dart'
    as _i3;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DiscoverRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.DiscoverScreen(),
      );
    },
    InternetErrorRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.InternetErrorScreen(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.ProductDetailScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.DiscoverScreen]
class DiscoverRoute extends _i5.PageRouteInfo<void> {
  const DiscoverRoute({List<_i5.PageRouteInfo>? children})
      : super(
          DiscoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.InternetErrorScreen]
class InternetErrorRoute extends _i5.PageRouteInfo<void> {
  const InternetErrorRoute({List<_i5.PageRouteInfo>? children})
      : super(
          InternetErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'InternetErrorRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ProductDetailScreen]
class ProductDetailRoute extends _i5.PageRouteInfo<void> {
  const ProductDetailRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ProductDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
