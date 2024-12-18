import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:perfect_computer/utils/widgets/dialog_widgets/alert_dialog_widget.dart';
import 'package:perfect_computer/utils/widgets/dialog_widgets/alert_dialog_with_result_widget.dart';
import 'package:perfect_computer/utils/widgets/dialog_widgets/information_dialog.dart';
import 'package:perfect_computer/utils/widgets/dialog_widgets/log_out_dialog.dart';
import 'package:perfect_computer/utils/widgets/dialog_widgets/progress_dialog_widget.dart';

class AppDialogs {
//TODO Please Wait Dialog
  static Future<void> showProgressDialog({
    String? msg,
    bool isDismissible = false,
  }) {
    return showDialog(
      context: Get.context!,
      barrierDismissible: isDismissible,
      builder: (ctx) => progressWidget(
        msg: msg,
      ),
    );
  }

//TODO Title,Subtitle Dialog
  static void showAlertDialog({
    required BuildContext context,
    required String title,
    required String description,
    required String firstButtonName,
    required String secondButtonName,
    required VoidCallback onFirstButtonClicked,
    required VoidCallback onSecondButtonClicked,
    bool isDismissible = false,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialogWidget(
          title: title,
          description: description,
          onFirstButtonClicked: onFirstButtonClicked,
          onSecondButtonClicked: onSecondButtonClicked,
          secondButtonName: secondButtonName,
          firstButtonName: firstButtonName,
        );
      },
      barrierDismissible: isDismissible,
    );
  }

  static Future<dynamic> showAlertDialogWithResult({
    required BuildContext context,
    required String title,
    required String description,
    required String firstButtonName,
    required String secondButtonName,
    required VoidCallback onFirstButtonClicked,
    required VoidCallback onSecondButtonClicked,
    bool isDismissible = false,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialogWithResultWidget(
          title: title,
          description: description,
          onFirstButtonClicked: onFirstButtonClicked,
          onSecondButtonClicked: onSecondButtonClicked,
          secondButtonName: secondButtonName,
          firstButtonName: firstButtonName,
        );
      },
      barrierDismissible: isDismissible,
    );
  }

  static Future<bool> showExitAlertDialog({
    required BuildContext context,
    required String title,
    required String description,
    required String firstButtonName,
    required String secondButtonName,
    required VoidCallback onFirstButtonClicked,
    required VoidCallback onSecondButtonClicked,
  }) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialogWidget(
          title: title,
          description: description,
          onFirstButtonClicked: onFirstButtonClicked,
          onSecondButtonClicked: onSecondButtonClicked,
          secondButtonName: secondButtonName,
          firstButtonName: firstButtonName,
        );
      },
      barrierDismissible: false,
    );
  }

  //TODO LogOut Dialog
  static Future<void> showLogoutDialogue({
    required BuildContext context,
    required VoidCallback onCancelBtnClick,
    required VoidCallback onLogoutBtnClick,
    bool barrierDismissible = false,
  }) {
    return showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (ctx) => logOutDialog(
        onCancelBtnClick: onCancelBtnClick,
        onLogoutBtnClick: onLogoutBtnClick,
      ),
    );
  }

  //TODO Information Dialog
  static Future<void> showInformationDialogue({
    required BuildContext context,
    String? title,
    required String description,
    required VoidCallback onOkBntClick,
    String okBtnTxt = "okay",
    bool barrierDismissible = true,
  }) {
    return showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (ctx) => informationDialog(
        title: title,
        description: description,
        onOkBntClick: onOkBntClick,
      ),
    );
  }
}
