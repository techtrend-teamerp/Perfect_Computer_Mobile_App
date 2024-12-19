import 'dart:io';
import 'dart:math' as math;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:perfect_computer/api/network_controller.dart';
import 'package:perfect_computer/constants/common_constants.dart';
import 'package:perfect_computer/utils/ui/ui_utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Helper {
  static void openWebPageUrl({
    required String url,
  }) async {
    print('URL :- $url');

    var parseUrl = Uri.parse(url);
    if (await canLaunchUrl(parseUrl)) {
      await launchUrl(parseUrl, mode: LaunchMode.externalApplication);
    } else {
      UiUtils.errorSnackBar(message: "Could not launch $url");
    }
  }

  static Future<File?> pickImage({
    required ImageSource source,
  }) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        return File(image.path);
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  //
  // static void openFileFromFilePath({
  //   required BuildContext context,
  //   required String filePath,
  // }) async {
  //   try {
  //     await OpenFile.open(filePath);
  //     return;
  //   } catch (error) {
  //     AppDialogs.showInformationDialogue(
  //       context: context,
  //       title: 'Error Occurred!',
  //       description: error.toString(),
  //       onOkBntClick: () => Get.back(),
  //     );
  //   }
  // }

  static double getFileSizeInMb({required String filePath}) {
    File fileObj = File(filePath);
    int fileLengthInBytes = fileObj.readAsBytesSync().lengthInBytes;
    double fileSizeInMb = fileLengthInBytes /
        1048576; //Note:- 1048576 = 1024 * 1024 so don't get confused
    return fileSizeInMb;
  }

  //
  static String getErrMsgFromDioError({
    required DioException dioError,
    required NetworkController networkController,
  }) {
    if (dioError.type == DioExceptionType.unknown) {
      if (dioError.error is SocketException) {
        return 'There is some issue with your internet connection. Please check your internet and try again.';
      }
      return 'Something went wrong!';
    } else if (dioError.type == DioExceptionType.badResponse) {
      if (dioError.response == null || dioError.response!.data == null) {
        return 'Something went wrong!';
      } else if (dioError.response!.statusCode == 401 ||
          dioError.response!.statusCode == 400) {
        if (dioError.response!.data.containsKey('message')) {
          return dioError.response!.data['message'];
        }
        return dioError.response!.data['message'];
      } else if (dioError.response!.statusCode == 404) {
        return 'Method Not Found  Status Code 404';
      } else if (dioError.response!.statusCode == 500) {
        if (dioError.response!.statusMessage == null) {
          return 'Internal Server Error!';
        }
        return dioError.response!.statusMessage!;
      }
      return 'Something went wrong!';
    } else if (dioError.type == DioExceptionType.connectionTimeout) {
      if (networkController.connectivityResult == ConnectivityResult.none) {
        return 'There is some issue with your internet connection. Please check your internet and try again.';
      }
      return 'Connection Timeout!';
    } else if (dioError.type == DioExceptionType.receiveTimeout) {
      if (networkController.connectivityResult == ConnectivityResult.none) {
        return 'There is some issue with your internet connection. Please check your internet and try again.';
      }
      return 'Receive Timeout!';
    } else if (dioError.type == DioExceptionType.sendTimeout) {
      if (networkController.connectivityResult == ConnectivityResult.none) {
        return 'There is some issue with your internet connection. Please check your internet and try again.';
      }
      return 'Send Timeout!';
    } else if (dioError.type == DioExceptionType.cancel) {
      if (networkController.connectivityResult == ConnectivityResult.none) {
        return 'There is some issue with your internet connection. Please check your internet and try again.';
      }
      return 'Request Cancelled!';
    }
    return 'Something went wrong!';
  }

  static Color parseColor(String hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF")))
          .withOpacity(opacity ?? 1);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  static String generateRandom6DigitOTP() {
    int min = 100000; //min and max values act as your 6 digit range
    int max = 999999;
    var rNum = min + math.Random().nextInt(max - min);
    return rNum.toString();
  }

  static bool checkIsEmptyOrNullForStringAndInt(Object? object) {
    if (object == null) {
      return true;
    } else if (object.toString().isEmpty) {
      return true;
    }
    return false;
  }

  static String getRelativeTime({
    required String? dateTimeString,
  }) {
    if (dateTimeString == null || dateTimeString.isEmpty) {
      return '';
    }

    DateTime updatedAt = DateTime.parse('${dateTimeString}Z').toLocal();

    Duration postDuration = DateTime.now().difference(updatedAt);

    int seconds = postDuration.inSeconds;
    int minutes = (seconds / 60).round();
    int hours = (seconds / 3600).round();
    int days = (seconds / 86400).round();
    int weeks = (seconds / 604800).round();
    int months = (seconds / 2600640).round();
    int years = (seconds / 31207680).round();

    if (seconds <= 60) {
      return "now";
    }

    if (minutes <= 60) {
      if (minutes == 1) {
        return "1 min";
      } else {
        return '${postDuration.inMinutes} mins';
      }
    }

    if (hours < 24) {
      if (hours == 1) {
        return "1 hour";
      } else {
        return '$hours hours';
      }
    }

    if (days <= 7) {
      if (days == 1) {
        return "yesterday";
      } else {
        return getWeekDayShortNameFromNo(dayNo: updatedAt.weekday);
      }
    }

    if (weeks <= 4.3) {
      return '${postDuration.inDays} days';
    }

    if (months <= 12) {
      if (months == 1) {
        return "1 month";
      } else {
        return '$months months';
      }
    }
    if (years == 1) {
      return "1 year";
    } else {
      return '$years years';
    }
  }

  static String getRelativeTimeComment({required String? dateTimeString}) {
    if (dateTimeString == null || dateTimeString.isEmpty) {
      return '';
    }

    DateTime updatedAtDateTime = DateTime.parse('${dateTimeString}Z').toLocal();
    Duration postDuration = DateTime.now().difference(updatedAtDateTime);

    int totalSeconds = postDuration.inSeconds;

    if (totalSeconds < 60) {
      return "Just now";
    }
    if (totalSeconds < 120) {
      return "1 minute ago";
    }
    if (totalSeconds < 2700) {
      return '${postDuration.inMinutes} minutes ago';
    }
    if (totalSeconds < 5400) {
      // 90 * 60
      return "1 hour ago";
    }
    if (totalSeconds < 86400) {
      // 24  60  60
      return '${postDuration.inHours} hours ago';
    }
    if (totalSeconds < 172800) {
      // 48  60  60
      return "Yesterday at ${DateFormat('hh:mm:ss tt').format(updatedAtDateTime)}";
    }

    return '${postDuration.inDays} days';
  }

  static String getWeekDayShortNameFromNo({required int dayNo}) {
    if (dayNo == 1) {
      return 'Mon';
    } else if (dayNo == 2) {
      return 'Tue';
    } else if (dayNo == 3) {
      return 'Wed';
    } else if (dayNo == 4) {
      return 'Thi';
    } else if (dayNo == 5) {
      return 'Fri';
    } else if (dayNo == 6) {
      return 'Sat';
    } else {
      return 'Sun';
    }
  }

  static math.Random random = math.Random();
  static List<Color> randomColorList = <Color>[
    Colors.blueGrey.shade100,
    Colors.cyan.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.grey.shade200,
    Colors.black38
  ];

  static Color getRandomColor() {
    int randomNumber = random.nextInt(randomColorList.length);
    return randomColorList[randomNumber];
  }

  static void log(Object message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
