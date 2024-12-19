import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:perfect_computer/utils/ui/app_dialogs.dart';

class PermissionUtil {
  static Future<bool> hasCameraPermission({
    required BuildContext context,
  }) async {
    try {
      PermissionStatus cameraPermissionStatus = await Permission.camera.status;
      if (cameraPermissionStatus.isGranted) {
        return true;
      } else if (cameraPermissionStatus.isDenied) {
        if (await Permission.camera.request().isGranted) {
          return true;
        }
        AppDialogs.showAlertDialog(
          context: context,
          title: 'Permission Required',
          description:
          'Please allow permission to access camera. Click on below button to open settings and allow permission .',
          firstButtonName: 'OPEN SETTINGS',
          secondButtonName: 'Cancel',
          onFirstButtonClicked: () async {
            Get.back();
            if (await openAppSettings()) {
              return;
            }
            AppDialogs.showInformationDialogue(
              context: context,
              description:
              'You have to manually allow camera permission by going to  PBN App Info -> Permissions -> Camera -> Allow only while using the app to use this feature!',
              onOkBntClick: () => Get.back(),
            );
            return;
          },
          onSecondButtonClicked: () => Get.back(),
        );
        return false;
      } else if (cameraPermissionStatus.isPermanentlyDenied) {
        AppDialogs.showAlertDialog(
          context: context,
          title: 'Permission Required',
          description:
          'Please allow permission to access camera. Click on below button to open settings and allow permission .',
          firstButtonName: 'OPEN SETTINGS',
          secondButtonName: 'Cancel',
          onFirstButtonClicked: () => openAppSettings(),
          onSecondButtonClicked: () => Get.back(),
        );
        return false;
      }
      return false;
    } catch (error) {
      AppDialogs.showAlertDialog(
        context: context,
        title: 'Error Occurred!',
        description: error.toString(),
        firstButtonName: 'Ok',
        secondButtonName: 'Cancel',
        onFirstButtonClicked: () => Get.back(),
        onSecondButtonClicked: () => Get.back(),
      );
      return false;
    }
  }

  static Future<bool> hasVideoPermission(
      {required BuildContext context}) async {
    var temp = defaultTargetPlatform == TargetPlatform.android
        ? await hasAndroidVideosPermission(context: context)
        : defaultTargetPlatform == TargetPlatform.iOS
        ? await hasIOSStoragePermission(context: context)
        : false;
    return temp;
  }

  static Future<bool> hasAndroidVideosPermission(
      {required BuildContext context}) async {
    AndroidDeviceInfo android = await DeviceInfoPlugin().androidInfo;
    int sdkVersion = android.version.sdkInt;
    try {
      PermissionStatus videoPermissionStatus = sdkVersion < 33
          ? await Permission.storage.status
          : await Permission.videos.status;

      if (videoPermissionStatus.isGranted) {
        return true;
      } else if (videoPermissionStatus.isDenied) {
        if (sdkVersion < 33
            ? await Permission.storage.request().isGranted
            : await Permission.videos.request().isGranted) {
          return true;
        }
        AppDialogs.showAlertDialog(
          context: context,
          title: 'Permission Required',
          description:
          'Please allow permission to access Media. Click on below button to open settings and allow permission To Allow Pick Video.',
          firstButtonName: 'OPEN SETTINGS',
          secondButtonName: 'Cancel',
          onFirstButtonClicked: () async {
            Get.back();
            if (await openAppSettings()) {
              return;
            }
            AppDialogs.showInformationDialogue(
              context: context,
              description:
              'You have to manually allow Media permission by going to  PBN App Info -> Permissions -> Photos And Videos -> Allow access to media only to use this feature!',
              onOkBntClick: () => Get.back(),
            );
            return;
          },
          onSecondButtonClicked: () => Get.back(),
        );
        return false;
      } else if (videoPermissionStatus.isPermanentlyDenied) {
        AppDialogs.showAlertDialog(
          context: context,
          title: 'Permission Required',
          description:
          'Please allow permission to access Videos. Click on below button to open settings and allow permission To Access Videos.',
          firstButtonName: 'OPEN SETTINGS',
          secondButtonName: 'Cancel',
          onFirstButtonClicked: () => openAppSettings(),
          onSecondButtonClicked: () => Get.back(),
        );
        return false;
      }
      return false;
    } catch (error) {
      AppDialogs.showAlertDialog(
        context: context,
        title: 'Error Occurred!',
        description: error.toString(),
        firstButtonName: 'Ok',
        secondButtonName: 'Cancel',
        onFirstButtonClicked: () => Get.back(),
        onSecondButtonClicked: () => Get.back(),
      );
      return false;
    }
  }

  static Future<bool> hasPhotosPermission({
    required BuildContext context,
  }) async {
    bool isAnroid = defaultTargetPlatform == TargetPlatform.android;
    bool isIos = defaultTargetPlatform == TargetPlatform.iOS;
    var temp = isAnroid
        ? await hasAndroidPhotosPermission(context: context)
        : isIos
        ? await hasIOSStoragePermission(context: context)
        : false;
    return temp;
  }

  static Future<bool> hasIOSStoragePermission(
      {required BuildContext context}) async {
    //For Approve Photos And Videos

    try {
      PermissionStatus storagePermissionStatus =
      await Permission.storage.status;
      if (storagePermissionStatus.isGranted) {
        return true;
      } else if (storagePermissionStatus.isDenied) {
        if (await Permission.storage.request().isGranted) {
          return true;
        }

        AppDialogs.showAlertDialog(
          context: context,
          title: 'Permission Required',
          description:
          'Please allow permission to access Media. Click on below button to open settings and allow permission .',
          firstButtonName: 'OPEN SETTINGS',
          secondButtonName: 'Cancel',
          onFirstButtonClicked: () async {
            Get.back();
            if (await openAppSettings()) {
              return;
            }
            AppDialogs.showInformationDialogue(
              context: context,
              description:
              'You have to manually allow storage permission by going to  PBN App Info -> Permissions -> Storage -> Allow access to media only to use this feature!',
              onOkBntClick: () => Get.back(),
            );
            return;
          },
          onSecondButtonClicked: () => Get.back(),
        );
        return false;
      } else if (storagePermissionStatus.isPermanentlyDenied) {
        AppDialogs.showAlertDialog(
          context: context,
          title: 'Permission Required',
          description:
          'Please allow permission to access Photos. Click on below button to open settings and allow permission .',
          firstButtonName: 'OPEN SETTINGS',
          secondButtonName: 'Cancel',
          onFirstButtonClicked: () => openAppSettings(),
          onSecondButtonClicked: () => Get.back(),
        );
        return false;
      }
      return false;
    } catch (error) {
      AppDialogs.showAlertDialog(
        context: context,
        title: 'Error Occurred!',
        description: error.toString(),
        firstButtonName: 'Ok',
        secondButtonName: 'Cancel',
        onFirstButtonClicked: () => Get.back(),
        onSecondButtonClicked: () => Get.back(),
      );
      return false;
    }
  }

  static Future<bool> hasAndroidPhotosPermission({
    required BuildContext context,
  }) async {
    try {
      DeviceInfoPlugin plugin = DeviceInfoPlugin();
      AndroidDeviceInfo android = await plugin.androidInfo;
      PermissionStatus photoPermissionStatus = android.version.sdkInt < 33
          ? await Permission.storage.status
          : await Permission.photos.status;

      if (photoPermissionStatus.isGranted) {
        return true;
      } else if (photoPermissionStatus.isDenied) {
        if (android.version.sdkInt < 33
            ? await Permission.storage.request().isGranted
            : await Permission.photos.request().isGranted) {
          return true;
        } else {
          AppDialogs.showAlertDialog(
            context: context,
            title: 'Permission Required',
            description:
            'Please allow permission to access Media. Click on below button to open settings and allow permission .',
            firstButtonName: 'OPEN SETTINGS',
            secondButtonName: 'Cancel',
            onFirstButtonClicked: () async {
              Get.back();
              if (await openAppSettings()) {
                return;
              }
              AppDialogs.showInformationDialogue(
                context: context,
                description:
                'You have to manually allow storage permission by going to  PBN App Info -> Permissions -> Photos And Videos -> Allow access to media only to use this feature!',
                onOkBntClick: () => Get.back(),
              );
              return;
            },
            onSecondButtonClicked: () => Get.back(),
          );
          return false;
        }
      } else if (photoPermissionStatus.isPermanentlyDenied) {
        AppDialogs.showAlertDialog(
          context: context,
          title: 'Permission Required',
          description:
          'Please allow permission to access Photos. Click on below button to open settings and allow permission .',
          firstButtonName: 'OPEN SETTINGS',
          secondButtonName: 'Cancel',
          onFirstButtonClicked: () => openAppSettings(),
          onSecondButtonClicked: () => Get.back(),
        );
        return false;
      } else {
        return false;
      }
    } catch (error) {
      AppDialogs.showAlertDialog(
        context: context,
        title: 'Error Occurred!',
        description: error.toString(),
        firstButtonName: 'Ok',
        secondButtonName: 'Cancel',
        onFirstButtonClicked: () => Get.back(),
        onSecondButtonClicked: () => Get.back(),
      );
      return false;
    }
  }

  static Future<bool> hasContactPermission({
    required BuildContext context,
  }) async {
    try {
      PermissionStatus contactPermissionStatus =
      await Permission.contacts.status;
      if (contactPermissionStatus.isGranted) {
        return true;
      } else if (contactPermissionStatus.isDenied) {
        if (await Permission.contacts.request().isGranted) {
          return true;
        }

        AppDialogs.showAlertDialog(
          context: context,
          title: 'Permission Required',
          description:
          'Please allow permission to access contacts. Click on below button to open settings and allow permission .',
          firstButtonName: 'OPEN SETTINGS',
          secondButtonName: 'Cancel',
          onFirstButtonClicked: () async {
            Get.back();
            if (await openAppSettings()) {
              return;
            }

            AppDialogs.showInformationDialogue(
              context: context,
              description:
              'You have to manually allow contacts permission by going to  PBN App Info -> Permissions -> Contacts -> Allow access to Contacts to use this feature!',
              onOkBntClick: () => Get.back(),
            );
            return;
          },
          onSecondButtonClicked: () => Get.back(),
        );
        return false;
      } else if (contactPermissionStatus.isPermanentlyDenied) {
        AppDialogs.showAlertDialog(
          context: context,
          title: 'Permission Required',
          description:
          'Please allow permission to access contacts. Click on below button to open settings and allow permission .',
          firstButtonName: 'OPEN SETTINGS',
          secondButtonName: 'Cancel',
          onFirstButtonClicked: () => openAppSettings(),
          onSecondButtonClicked: () => Get.back(),
        );
        return false;
      }
      return false;
    } catch (error) {
      AppDialogs.showAlertDialog(
        context: context,
        title: 'Error Occurred!',
        description: error.toString(),
        firstButtonName: 'Ok',
        secondButtonName: 'Cancel',
        onFirstButtonClicked: () => Get.back(),
        onSecondButtonClicked: () => Get.back(),
      );
      return false;
    }
  }

  // static Future<bool> hasLocationPermission({
  //   required BuildContext context,
  // }) async {
  //   try {
  //     final GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  //     bool serviceEnabled = await geolocatorPlatform.isLocationServiceEnabled();
  //     if (serviceEnabled) {
  //       LocationPermission permission =
  //       await geolocatorPlatform.checkPermission();
  //       if (permission == LocationPermission.whileInUse ||
  //           permission == LocationPermission.always) {
  //         return true;
  //       } else if (permission == LocationPermission.denied) {
  //         permission = await geolocatorPlatform.requestPermission();
  //         if (permission == LocationPermission.whileInUse ||
  //             permission == LocationPermission.always) {
  //           return true;
  //         } else if (permission == LocationPermission.denied) {
  //           permission = await geolocatorPlatform.requestPermission();
  //           if (permission == LocationPermission.whileInUse ||
  //               permission == LocationPermission.always) {
  //             return true;
  //           } else {
  //             AppDialogs.showAlertDialog(
  //               context: context,
  //               title: 'Required Permission!',
  //               description:
  //               'Location Permission Required to access this feature,You have to manually allow location permission by click on open setting button and find locations and then allow permission!',
  //               firstButtonName: 'OPEN SETTINGS',
  //               secondButtonName: 'Cancel',
  //               onFirstButtonClicked: () {
  //                 openAppSettings().then(
  //                       (value) => Get.back(),
  //                 );
  //               },
  //               onSecondButtonClicked: () => Get.back(),
  //             );
  //             return false;
  //           }
  //         } else {
  //           AppDialogs.showAlertDialog(
  //             context: context,
  //             title: 'Required Permission!',
  //             description:
  //             'Location Permission Required to access this feature,You have to manually allow location permission by click on open setting button and find locations and then allow permission!',
  //             firstButtonName: 'OPEN SETTINGS',
  //             secondButtonName: 'Cancel',
  //             onFirstButtonClicked: () {
  //               openAppSettings().then(
  //                     (value) => Get.back(),
  //               );
  //             },
  //             onSecondButtonClicked: () => Get.back(),
  //           );
  //           return false;
  //         }
  //       } else {
  //         AppDialogs.showAlertDialog(
  //           context: context,
  //           title: 'Required Permission!',
  //           description:
  //           'Location Permission Required to access this feature,You have to manually allow location permission by click on open setting button and find locations and then allow permission!',
  //           firstButtonName: 'OPEN SETTINGS',
  //           secondButtonName: 'Cancel',
  //           onFirstButtonClicked: () {
  //             openAppSettings().then(
  //                   (value) => Get.back(),
  //             );
  //           },
  //           onSecondButtonClicked: () => Get.back(),
  //         );
  //         return false;
  //       }
  //     } else {
  //       AppDialogs.showAlertDialog(
  //         context: context,
  //         title: 'Location Services Disabled!',
  //         description:
  //         'Location Services Disabled In Your Phone To Access to this feature you need to manually enable location services by click on open settings button and click again to access this feature!',
  //         firstButtonName: 'OPEN SETTINGS',
  //         secondButtonName: 'Cancel',
  //         onFirstButtonClicked: () {
  //           AppSettings.openAppSettings().then(
  //                 (value) => Get.back(),
  //           );
  //         },
  //         onSecondButtonClicked: () => Get.back(),
  //       );
  //       return false;
  //     }
  //   } catch (error) {
  //     AppDialogs.showAlertDialog(
  //       context: context,
  //       title: 'Error Occurred!',
  //       description: error.toString(),
  //       firstButtonName: 'Ok',
  //       secondButtonName: 'Cancel',
  //       onFirstButtonClicked: () => Get.back(),
  //       onSecondButtonClicked: () => Get.back(),
  //     );
  //     return false;
  //   }
  // }
}
