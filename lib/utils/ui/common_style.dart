// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class CommonStyle {
//   static InputDecoration getTextFormFiledDecorationForLogin({
//     required String label,
//     required String hintText,
//     required IconData? prefixIcon,
//     String? prefixText,
//     Widget? sufixWidget,
//     Function? onSuffixIconClick,
//   }) {
//     InputDecoration inputDecoration;
//     inputDecoration = InputDecoration(
//       contentPadding: const EdgeInsets.only(
//         top: 6.0,
//         bottom: 6.0,
//         left: 16.0,
//       ),
//       prefixIcon: Icon(prefixIcon),
//       hintText: hintText,
//       prefixText: prefixText ?? '',
//       prefixStyle: TextStyle(
//         fontSize: Get.textTheme.subtitle1!.fontSize!,
//         color: Colors.grey,
//       ),
//       label: Text(
//         label,
//         style: const TextStyle(color: Colors.black),
//       ),
//       labelStyle: TextStyle(
//         color: Get.theme.primaryColor,
//       ),
//       counterText: '',
//       errorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       focusedBorder: OutlineInputBorder(
//         gapPadding: 2.0,
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.6),
//       ),
//       enabledBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.grey, width: 1.6),
//       ),
//       focusedErrorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       suffixIcon: sufixWidget ??
//           const Padding(
//             padding: EdgeInsets.all(14.0),
//             child: SizedBox(
//               height: 24.0,
//               width: 24.0,
//             ),
//           ),
//       border: InputBorder.none,
//       hintStyle: TextStyle(
//         color: Colors.grey,
//         fontSize: Get.textTheme.subtitle2!.fontSize,
//       ),
//     );
//     return inputDecoration;
//   }
//
//   static InputDecoration getTextFormFiledDecorationForRegistration({
//     required String label,
//     required String hintText,
//     required IconData prefixIcon,
//     String? prefixText,
//     Widget? sufixWidget,
//     Function? onSuffixIconClick,
//   }) {
//     InputDecoration inputDecoration;
//     inputDecoration = InputDecoration(
//       contentPadding: const EdgeInsets.only(
//         top: 6.0,
//         bottom: 6.0,
//         left: 16.0,
//       ),
//       prefix: prefixText == null ? null : Text(prefixText),
//       prefixIcon: Icon(prefixIcon),
//       hintText: hintText,
//       label: Text(
//         label,
//         style: const TextStyle(color: Colors.black),
//       ),
//       labelStyle: TextStyle(
//         color: Get.theme.primaryColor,
//       ),
//       counterText: '',
//       errorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       focusedBorder: OutlineInputBorder(
//         gapPadding: 2.0,
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.6),
//       ),
//       enabledBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.grey, width: 1.6),
//       ),
//       focusedErrorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       suffixIcon: sufixWidget ??
//           const Padding(
//             padding: EdgeInsets.all(14.0),
//             child: SizedBox(
//               height: 24.0,
//               width: 24.0,
//             ),
//           ),
//       border: InputBorder.none,
//       hintStyle: TextStyle(
//         color: Colors.grey,
//         fontSize: Get.textTheme.subtitle2!.fontSize,
//       ),
//     );
//     return inputDecoration;
//   }
//
//   static InputDecoration getTextFormFiledDecorationForConvertMoney({
//     required String label,
//     required String hintText,
//     required IconData prefixIcon,
//     String? prefixText,
//   }) {
//     InputDecoration inputDecoration;
//     inputDecoration = InputDecoration(
//       contentPadding: const EdgeInsets.only(
//         top: 6.0,
//         bottom: 6.0,
//         left: 16.0,
//       ),
//       prefixIcon: Icon(prefixIcon),
//       prefixText: prefixText,
//       hintText: hintText,
//       label: Text(
//         label,
//         style: const TextStyle(color: Colors.black),
//       ),
//       labelStyle: TextStyle(
//         color: Get.theme.primaryColor,
//       ),
//       counterText: '',
//       errorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       focusedBorder: OutlineInputBorder(
//         gapPadding: 2.0,
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.6),
//       ),
//       enabledBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.grey, width: 1.6),
//       ),
//       disabledBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.grey, width: 1.6),
//       ),
//       focusedErrorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       border: InputBorder.none,
//       hintStyle: TextStyle(
//         color: Colors.grey,
//         fontSize: Get.textTheme.subtitle2!.fontSize,
//       ),
//     );
//     return inputDecoration;
//   }
//
//   static InputDecoration getTextFormFiledDecorationForChangePassword({
//     required String label,
//     required String hintText,
//     required IconData? prefixIcon,
//     Widget? sufixWidget,
//     Function? onSuffixIconClick,
//   }) {
//     InputDecoration inputDecoration;
//     inputDecoration = InputDecoration(
//       contentPadding: const EdgeInsets.only(
//         top: 6.0,
//         bottom: 6.0,
//         left: 16.0,
//       ),
//       prefixIcon: Icon(prefixIcon),
//       hintText: hintText,
//       label: Text(
//         label,
//         style: const TextStyle(color: Colors.black),
//       ),
//       labelStyle: TextStyle(
//         color: Get.theme.primaryColor,
//       ),
//       counterText: '',
//       errorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       focusedBorder: OutlineInputBorder(
//         gapPadding: 2.0,
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.6),
//       ),
//       enabledBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.grey, width: 1.6),
//       ),
//       focusedErrorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       suffixIcon: sufixWidget ??
//           const Padding(
//             padding: EdgeInsets.all(14.0),
//             child: SizedBox(
//               height: 24.0,
//               width: 24.0,
//             ),
//           ),
//       border: InputBorder.none,
//       hintStyle: TextStyle(
//         color: Colors.grey,
//         fontSize: Get.textTheme.subtitle2!.fontSize,
//       ),
//     );
//     return inputDecoration;
//   }
//
//   static InputDecoration getTextFormFiledDecorationForRaiseQuery({
//     required String label,
//     required String hintText,
//     required IconData prefixIcon,
//     String? prefixText,
//     required double topPadding,
//   }) {
//     InputDecoration inputDecoration;
//     inputDecoration = InputDecoration(
//       contentPadding: EdgeInsets.only(
//         top: topPadding,
//         bottom: 6.0,
//         left: 16.0,
//       ),
//       prefixIcon: Icon(prefixIcon),
//       prefixText: prefixText,
//       hintText: hintText,
//       label: Text(
//         label,
//         style: const TextStyle(color: Colors.black),
//       ),
//       labelStyle: TextStyle(
//         color: Get.theme.primaryColor,
//       ),
//       counterText: '',
//       errorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       focusedBorder: OutlineInputBorder(
//         gapPadding: 2.0,
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.6),
//       ),
//       enabledBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.grey, width: 1.6),
//       ),
//       focusedErrorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       border: InputBorder.none,
//       hintStyle: TextStyle(
//         color: Colors.grey,
//         fontSize: Get.textTheme.subtitle2!.fontSize,
//       ),
//     );
//     return inputDecoration;
//   }
//
//   static InputDecoration getTextFormFiledDecorationForForgotPass({
//     required String label,
//     required String hintText,
//     required IconData prefixIcon,
//   }) {
//     InputDecoration inputDecoration;
//     inputDecoration = InputDecoration(
//       contentPadding: const EdgeInsets.only(
//         top: 6.0,
//         bottom: 6.0,
//         left: 16.0,
//       ),
//       prefixIcon: Icon(prefixIcon),
//       hintText: hintText,
//       label: Text(
//         label,
//         style: const TextStyle(color: Colors.black),
//       ),
//       labelStyle: TextStyle(
//         color: Get.theme.primaryColor,
//       ),
//       counterText: '',
//       errorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       focusedBorder: OutlineInputBorder(
//         gapPadding: 2.0,
//         borderRadius: const BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Get.theme.primaryColor, width: 1.6),
//       ),
//       enabledBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.grey, width: 1.6),
//       ),
//       focusedErrorBorder: const OutlineInputBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(8.0),
//         ),
//         borderSide: BorderSide(color: Colors.red, width: 1.6),
//       ),
//       border: InputBorder.none,
//       hintStyle: TextStyle(
//         color: Colors.grey,
//         fontSize: Get.textTheme.subtitle2!.fontSize,
//       ),
//     );
//     return inputDecoration;
//   }
//
//   static InputDecoration getTextFormFiledDecorationForForgotPassDialog({
//     required IconData icon,
//     Widget? suffixWidget,
//     required String hintText,
//   }) {
//     InputDecoration inputDecoration;
//     inputDecoration = InputDecoration(
//       icon: Icon(
//         icon,
//       ),
//       hintText: hintText,
//       counterText: '',
//       suffixIcon: suffixWidget,
//       hintStyle: TextStyle(
//         color: Colors.grey,
//         fontSize: Get.textTheme.subtitle2!.fontSize,
//       ),
//     );
//     return inputDecoration;
//   }
// }
