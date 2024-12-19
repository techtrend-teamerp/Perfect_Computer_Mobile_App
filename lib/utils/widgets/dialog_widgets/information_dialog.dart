import 'package:flutter/material.dart';

AlertDialog informationDialog({
  required String? title,
  required String description,
  required VoidCallback onOkBntClick,
}) {
  return AlertDialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          7.0,
        ),
      ),
    ),
    title: title == null
        ? null
        : Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
    content: Text(
      description,
      style: const TextStyle(color: Colors.black87),
    ),
    actions: [
      ElevatedButton(
        onPressed: onOkBntClick,
        child: const Text(
          "Okay",
        ),
      ),
    ],
  );
}
