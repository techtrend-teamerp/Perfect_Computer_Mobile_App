import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:perfect_computer/api/network_binding.dart';
import 'package:perfect_computer/config/app_theme.dart';
import 'package:perfect_computer/config/routes/app_routes.dart';
import 'package:perfect_computer/config/routes/app_screens.dart';
import 'package:perfect_computer/constants/common_constants.dart';
import 'package:perfect_computer/constants/string_constants.dart';
import 'package:perfect_computer/utils/helpers/preference_obj.dart';
import 'package:perfect_computer/utils/services/check_version_service.dart';
import 'package:perfect_computer/utils/services/language_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await VersionCheckService().checkVersion();
  await PreferenceObj.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: CommonConstants.kPrimaryColor,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) async {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: StringConstants.appName,
      initialBinding: NetworkBinding(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: initialRoute,
      locale: const Locale('en', 'US'),
      getPages: AppScreens.screenList,
      translations: LocaleString(),
    );
  }

  String get initialRoute {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      VersionCheckService.onRedirectUpdateScreen();
    });

    return AppRoutes.onBoardingScreen;
  }
}
