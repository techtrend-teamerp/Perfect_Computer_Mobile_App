import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:perfect_computer/config/routes/app_routes.dart';
import 'package:perfect_computer/modules/driver/screen/add_demo_screen.dart';
import 'package:perfect_computer/modules/dashboard/screens/dashboard_screen.dart';
import 'package:perfect_computer/modules/login/screen/login_screen.dart';
import 'package:perfect_computer/modules/on_boarding/screen/on_board_screen.dart';
import 'package:perfect_computer/modules/on_boarding/screen/on_boarding_select_language_screen.dart';

class AppScreens {
  static var screenList = [
    GetPage(
      name: AppRoutes.dashboardScreen,
      page: () => const DashboardScreen(),
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: AppRoutes.onBoardingScreen,
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: AppRoutes.onBoardingSelectLanguageScreen,
      page: () => const OnBoardingSelectLanguagesScreen(),
    ),
    GetPage(
      name: AppRoutes.addDriverScreen,
      page: () => const AddDemoScreen(),
    ),
  ];
}
