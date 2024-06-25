import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_shoesly/routes/app_routes.gr.dart';
import 'package:sukant_shoesly/routes/route_utils.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/dimens.dart';
import 'package:sukant_shoesly/shared/utils/image_constants.dart';
import 'package:sukant_shoesly/shared/utils/strings.dart';
import 'package:sukant_shoesly/shared/utils/text_styles.dart';
import 'package:sukant_shoesly/shared/utils/utils.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.spacing_32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                ImageConstants.shoeslyIcon,
                height: Dimens.spacing_128,
              ),
              addVerticalSpace(Dimens.spacing_32),
              const Text(
                Strings.appName,
                style: text_headline900_w700_48,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void initTimer() async {
    PageRouteInfo route;
    if (await checkInternetConnection()) {
      route = const DiscoverRoute();
    } else {
      route = const InternetErrorRoute();
    }
    Timer(
      const Duration(seconds: 3),
      () {
        navigateTo(route);
      },
    );
  }

  void navigateTo(PageRouteInfo route) {
    context.replaceRoute(route);
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
