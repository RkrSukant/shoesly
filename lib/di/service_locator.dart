import 'package:get_it/get_it.dart';
import 'package:sukant_shoesly/routes/app_routes.dart';

final GetIt locator = GetIt.instance;

Future setUpServiceLocator() async{
  locator.registerSingleton(AppRouter());
}