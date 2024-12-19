// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HelperTextWidget extends StatelessWidget {
//   late double marginFromLeftSide;
//   late double marginFromTop;
//   final String helperText;
//   final bool isRequired;
//
//   HelperTextWidget({
//     required this.helperText,
//     required this.isRequired,
//     this.marginFromLeftSide = 40.0,
//     this.marginFromTop = 10.0,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           height: marginFromTop,
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               width: marginFromLeftSide,
//             ),
//             Icon(
//               Icons.info_outline,
//               size: 15.0,
//               color: Get.theme.primaryColor,
//             ),
//             const SizedBox(
//               width: 4.0,
//             ),
//             Expanded(
//               child: Text(
//                 '$helperText ${isRequired ? ' *' : ''}',
//                 style: TextStyle(
//                   fontSize: Get.textTheme.caption!.fontSize,
//                   color: Colors.grey,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
