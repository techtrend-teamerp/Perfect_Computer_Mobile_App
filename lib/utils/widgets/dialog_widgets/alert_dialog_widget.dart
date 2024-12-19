import 'package:flutter/material.dart';
import 'package:perfect_computer/utils/helpers/app_font.dart';

AlertDialog alertDialogWidget({
  required String title,
  required String description,
  required String firstButtonName,
  required String secondButtonName,
  required VoidCallback onFirstButtonClicked,
  required VoidCallback onSecondButtonClicked,
}) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(7.0),
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    content: Text(
      description,
      style: Font.subTitle2(),
    ),
    actions: [
      ElevatedButton(
        onPressed: onFirstButtonClicked,
        child: Text(
          firstButtonName,
        ),
      ),
      const SizedBox(
        width: 8.0,
      ),
      ElevatedButton(
        onPressed: onSecondButtonClicked,
        child: Text(
          secondButtonName,
        ),
      ),
    ],
  );
}
