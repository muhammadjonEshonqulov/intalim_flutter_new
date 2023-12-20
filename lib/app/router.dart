import 'package:go_router/go_router.dart';
import 'package:intalim/features/main/page/main_screen.dart';
import 'package:intalim/features/splash/page/splash_screen.dart';

import '../features/login/page/login_screen.dart';

abstract final class Routes {
  static const splash = '/splash';
  static const login = '/login';
  static const home = '/home';
  static const main = '/main';
  static const language = '/language';
  static const drawer = '/drawer';

  static  const baseUrl = "http://back.intalim.uz/api/";
}
final router = GoRouter(
  initialLocation: Routes.splash,
  // initialExtra: const SurveyStep3PageExtra(
  //   surveyUuid: '8e75322c-0e42-4636-93bc-635b9012bc48',
  //   streetId: null,
  //   surveyId: null,
  // ),
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.login,
      builder: (context, state) => const LoginPageWithRepo(),
    ),
    // GoRoute(
    //   path: Routes.home,
    //   builder: (context, state) => const HomePage(),
    // ),
    GoRoute(
      path: Routes.main,
      builder: (context, state) => const MainScreen(),
    ),
  ],
);
