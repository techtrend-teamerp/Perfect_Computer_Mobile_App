import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:perfect_computer/constants/app_colors.dart';
import 'package:perfect_computer/constants/images_path.dart';
import 'package:perfect_computer/utils/ui/ui_utils.dart';
import 'package:url_launcher/url_launcher.dart';

enum AppUpdateType { flexibleUpdate, forceUpdate, none }

class UpdateAppScreen extends StatefulWidget {
  final AppUpdateType appUpdateType;
  final String appUrl;
  final bool isForceLogout;
  static const routeName = '/update_app_screen';

  const UpdateAppScreen({
    super.key,
    required this.appUpdateType,
    required this.appUrl,
    required this.isForceLogout,
  });

  @override
  State<UpdateAppScreen> createState() => _UpdateAppScreenState();
}

class _UpdateAppScreenState extends State<UpdateAppScreen> {
  AppUpdateType? appUpdateType;

  @override
  void initState() {
    super.initState();
    appUpdateType = widget.appUpdateType;
  }

  updateAppLaunch(String url) async {
    if (Platform.isAndroid || Platform.isIOS) {
      final uri = Uri.parse(url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        UiUtils.showAlertSnackBar(
            heading: 'Could not launch', message: "Could not launch $url");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool pop) async {
        if (pop) {
          return;
        }

        if (appUpdateType == AppUpdateType.flexibleUpdate) {
          Navigator.of(context).pop();
        } else {
          SystemNavigator.pop();
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  child: Lottie.asset(
                    ImagesPath.updateAppAnimation,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 12.0,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'We\'re better than ever',
                          style: TextStyle(
                            color: AppColor.black,
                            fontSize: Get.textTheme.titleLarge!.fontSize,
                          ),
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),
                        Text(
                          'we added lots of new features and \nfix some bugs to make your experience as \nsmooth as possible',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Get.textTheme.labelLarge!.fontSize,
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        InkWell(
                          onTap: () {
                            updateAppLaunch(widget.appUrl);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 12.0,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: const Text(
                              'UPDATE APP',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        appUpdateType == AppUpdateType.flexibleUpdate
                            ? TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Not Now',
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize:
                                          Get.textTheme.labelLarge!.fontSize,
                                    ),
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
