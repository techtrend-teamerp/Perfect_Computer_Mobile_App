import 'package:flutter/material.dart';
import 'package:perfect_computer/utils/helpers/app_font.dart';

AlertDialog logOutDialog({
  required VoidCallback onCancelBtnClick,
  required VoidCallback onLogoutBtnClick,
}) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          7.0,
        ),
      ),
    ),
    content: const Text(
      "Are You Sure You Want to Logout?",
      style: TextStyle(
        color: Colors.black87,
      ),
    ),
    actions: [
      TextButton(
        onPressed: onCancelBtnClick,
        child: Text(
          "Cancel",
          style: Font.subTitle1(),
        ),
      ),
      const SizedBox(
        width: 8.0,
      ),
      ElevatedButton(
        onPressed: onLogoutBtnClick,
        child: const Text(
          "Log Out",
        ),
      ),
    ],
  );
}
