import 'dart:async';

import 'package:package_info_plus/package_info_plus.dart';

class GetPackageInfo {
  static PackageInfo? _packageInfo;
  static String? _versionCode;
  static String? _versionName;

  static Future<PackageInfo> _getPackageInfoInstance() async {
    if (_packageInfo == null) {
      _packageInfo = await PackageInfo.fromPlatform();
      return _packageInfo!;
    }
    return _packageInfo!;
  }

  static Future<String> getAppVersionCode() async {
    if (_versionCode == null) {
      PackageInfo tempPackageInfoObj = await _getPackageInfoInstance();
      _versionCode = tempPackageInfoObj.buildNumber;
      return _versionCode!;
    }
    return _versionCode!;
  }

  static Future<String> getAppVersionName() async {
    if (_versionName == null) {
      PackageInfo tempPackageInfoObj = await _getPackageInfoInstance();
      _versionName = tempPackageInfoObj.version;
      return _versionName!;
    }
    return _versionName!;
  }
}
