import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sukant_shoesly/routes/app_routes.dart';
import 'package:sukant_shoesly/shared/utils/app_theme.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';
import 'package:sukant_shoesly/shared/utils/strings.dart';
import 'di/service_locator.dart' as di;
import 'di/service_locator.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.setUpServiceLocator();

  runApp(const ProviderScope(child: MyApp()));

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRoute = locator<AppRouter>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.backgroundColor,
        statusBarColor: AppColors.backgroundColor,
      ),
    );

    return ProviderScope(child: Consumer(builder: (context, ref, child) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        theme: AppTheme.define(),
        routerConfig: appRoute.config(),
      );
    }));
  }
}
