// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:sukant_shoesly/features/cart/presentation/screens/cart_screen.dart'
    as _i1;
import 'package:sukant_shoesly/features/discover/presentation/screens/discover_screen.dart'
    as _i2;
import 'package:sukant_shoesly/features/filter/presentation/screens/filter_screen.dart'
    as _i3;
import 'package:sukant_shoesly/features/landing/internet_error_screen.dart'
    as _i4;
import 'package:sukant_shoesly/features/landing/splash_screen.dart' as _i8;
import 'package:sukant_shoesly/features/order_summary/presentation/screens/order_summary_screen.dart'
    as _i5;
import 'package:sukant_shoesly/features/product_detail/presentation/screens/product_detail_screen.dart'
    as _i6;
import 'package:sukant_shoesly/features/product_review/presentation/screens/product_review_screen.dart'
    as _i7;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    CartRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CartScreen(),
      );
    },
    DiscoverRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DiscoverScreen(),
      );
    },
    FilterRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FilterScreen(),
      );
    },
    InternetErrorRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.InternetErrorScreen(),
      );
    },
    OrderSummaryRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OrderSummaryScreen(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ProductDetailScreen(),
      );
    },
    ProductReviewRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.ProductReviewScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CartScreen]
class CartRoute extends _i9.PageRouteInfo<void> {
  const CartRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CartRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DiscoverScreen]
class DiscoverRoute extends _i9.PageRouteInfo<void> {
  const DiscoverRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DiscoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.FilterScreen]
class FilterRoute extends _i9.PageRouteInfo<void> {
  const FilterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          FilterRoute.name,
          initialChildren: children,
        );

  static const String name = 'FilterRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.InternetErrorScreen]
class InternetErrorRoute extends _i9.PageRouteInfo<void> {
  const InternetErrorRoute({List<_i9.PageRouteInfo>? children})
      : super(
          InternetErrorRoute.name,
          initialChildren: children,
        );

  static const String name = 'InternetErrorRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OrderSummaryScreen]
class OrderSummaryRoute extends _i9.PageRouteInfo<void> {
  const OrderSummaryRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OrderSummaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrderSummaryRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ProductDetailScreen]
class ProductDetailRoute extends _i9.PageRouteInfo<void> {
  const ProductDetailRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProductDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.ProductReviewScreen]
class ProductReviewRoute extends _i9.PageRouteInfo<void> {
  const ProductReviewRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ProductReviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductReviewRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
