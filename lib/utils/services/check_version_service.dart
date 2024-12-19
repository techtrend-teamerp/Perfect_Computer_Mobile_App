import 'dart:io';
import 'package:get/get.dart';
import 'package:perfect_computer/api/api_implementer.dart';
import 'package:perfect_computer/modules/on_boarding/model/check_version_model.dart';
import 'package:perfect_computer/utils/helpers/get_package_info.dart';
import 'package:perfect_computer/utils/helpers/helper.dart';
import 'package:perfect_computer/utils/ui/update_app_screen.dart';

class VersionCheckService {
  static CheckVersion versionInfo = CheckVersion();

  Future<void> checkVersion() async {
    try {
      String versionCode = await GetPackageInfo.getAppVersionCode();
      int appType = Platform.isAndroid ? 1 : 0;
      var response = await ApiImplementer.checkVersionApiCall(
        version: '3', // versionCode,
        appType: appType,
      );
      if (response.result.isNotEmpty) {
        versionInfo = response.result.first;
      }
    } catch (error) {
      Helper.log(error);
    }
  }

  static void onRedirectUpdateScreen() {
    switch (versionInfo.severity) {
      case 0:
        return;

      case 1:
        Get.to(
          () => const UpdateAppScreen(
            appUpdateType: AppUpdateType.flexibleUpdate,
            appUrl: '',
            isForceLogout: false,
          ),
        );
      case 2:
        Get.to(
          () => const UpdateAppScreen(
            appUpdateType: AppUpdateType.forceUpdate,
            appUrl: '',
            isForceLogout: false,
          ),
        );

      default:
        return;
    }
  }
}
