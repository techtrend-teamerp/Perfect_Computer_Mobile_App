import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiUtils {
  static SnackbarController showAlertSnackBar({
    required String heading,
    required String message,
  }) {
    Get.closeAllSnackbars();
    return Get.snackbar(heading, message,
        colorText: Colors.white,
        backgroundColor: Colors.grey.withOpacity(0.6),
        icon: const Icon(
          Icons.warning_amber,
          color: Colors.white,
        ),
        duration: const Duration(seconds: 1));
  }

  static SnackbarController successSnackBar({
    String title = 'Success',
    String message = "",
  }) {
    Get.closeAllSnackbars();
    return Get.snackbar(
      title,
      message,
      icon: Wrap(
        children: [
          Card(
            elevation: 2.0,
            margin: const EdgeInsets.all(8.0),
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.check_circle, size: 32.0, color: Colors.white),
            ),
          ),
        ],
      ),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
      borderWidth: 1.0,
      borderRadius: 12.0,
    );
  }

  static SnackbarController errorSnackBar({
    String title = 'Error',
    String message = "",
  }) {
    Get.closeAllSnackbars();
    return Get.snackbar(
      title,
      message,
      icon: Wrap(
        children: [
          Card(
            elevation: 2.0,
            margin: const EdgeInsets.all(8.0),
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child:
                  Icon(Icons.warning_rounded, size: 32.0, color: Colors.white),
            ),
          ),
        ],
      ),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
      borderWidth: 1.0,
      borderRadius: 12.0,
    );
  }

  static SnackbarController alertSnackBar({
    String title = 'Alert',
    String? message,
  }) {
    Get.closeAllSnackbars();
    return Get.snackbar(
      title,
      message ?? "",
      icon: Wrap(
        children: [
          Card(
            elevation: 2.0,
            margin: const EdgeInsets.all(8.0),
            color: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.notifications_on_rounded,
                  size: 32.0, color: Colors.white),
            ),
          ),
        ],
      ),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.red.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
      borderWidth: 1.0,
      borderRadius: 12.0,
    );
  }

  static SnackbarController buttonSnackBar({
    String title = 'Success',
    String message = "",
    required String buttonText,
    required VoidCallback buttonOnPressed,
  }) {
    Get.closeAllSnackbars();
    return Get.snackbar(
      title,
      message,
      icon: Wrap(
        children: [
          Card(
            elevation: 2.0,
            margin: const EdgeInsets.all(8.0),
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(Icons.check_circle, size: 32.0, color: Colors.white),
            ),
          ),
        ],
      ),
      mainButton:
          TextButton(onPressed: buttonOnPressed, child: Text(buttonText)),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.green.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
      borderWidth: 1.0,
      borderRadius: 12.0,
    );
  }
}
