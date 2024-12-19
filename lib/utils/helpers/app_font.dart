import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Font {
  Font._();

  static TextStyle title1({Color color = Colors.black}) => TextStyle(
        fontSize: Get.width * 0.07,
        color: color,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.9,
      );

  static TextStyle title2({Color color = Colors.black}) => TextStyle(
        fontSize: Get.width * 0.06,
        color: color,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.9,
      );

  static TextStyle subTitle1({Color color = Colors.black}) => TextStyle(
        fontSize: Get.width <= 550 ? Get.width * 0.05 : Get.width * 0.030,
        color: color,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.9,
      );

  static TextStyle subTitle2({Color color = Colors.black}) => TextStyle(
        fontSize: Get.width * 0.05,
        color: color,
        letterSpacing: 0.9,
      );

  static TextStyle bodyText1({Color color = Colors.black}) => TextStyle(
        fontSize: Get.width <= 550 ? Get.width * 0.04 : Get.width * 0.025,
        color: color,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.9,
      );

  static TextStyle bodyText2({Color color = Colors.black}) => TextStyle(
        fontSize: Get.width * 0.04,
        color: color,
        letterSpacing: 0.9,
      );

  static TextStyle bodyText3({Color color = Colors.black}) => TextStyle(
        fontSize: Get.width * 0.03,
        color: color,
        letterSpacing: 0.4,
      );

  static TextStyle label1({Color color = Colors.black}) => TextStyle(
        fontSize: Get.width <= 550 ? Get.width * 0.033 : Get.width * 0.022,
        color: color,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.9,
      );

  static TextStyle label1system({Color color = Colors.black}) => TextStyle(
        fontSize: Get.width <= 550
            ? Get.width * 0.033
            : Get.width <= 770
                ? Get.width * 0.028
                : Get.width * 0.022,
        color: color,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.4,
      );

  static TextStyle label2({Color color = Colors.black}) => TextStyle(
        fontSize: Get.width <= 550 ? Get.width * 0.033 : Get.width * 0.022,
        color: color,
        letterSpacing: 0.9,
      );

  static TextStyle label3({Color color = Colors.black}) => TextStyle(
        fontSize: Get.width <= 550 ? Get.width * 0.025 : Get.width * 0.018,
        color: color,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.9,
      );

  static TextStyle text(
          {Color? color,
          required double size,
          FontWeight? weight,
          double? space}) =>
      TextStyle(
          fontSize: size,
          color: color ?? Colors.black,
          fontWeight: weight,
          letterSpacing: space);

  static TextStyle systemTxtStyle(
          {Color color = Colors.black,
          double stroke = 1.6,
          double? size,
          double? space,
          FontWeight? weight}) =>
      TextStyle(
          fontSize:
              Get.width <= 550 ? (size ?? Get.width * 0.09) : Get.width * 0.07,
          fontWeight: weight ?? FontWeight.w600,
          letterSpacing: space ?? 2.5,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = stroke
            ..color = color);
}
