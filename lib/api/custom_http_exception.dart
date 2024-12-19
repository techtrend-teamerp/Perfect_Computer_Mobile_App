import 'dart:io';

import 'package:dio/dio.dart';

class CustomHttpException {
  final String errMessage;

  CustomHttpException({required this.errMessage});

  @override
  String toString() {
    return errMessage;
  }

  static String handleDioError({required DioException dioError}) {
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
        if (dioError.response!.data.containsKey('error_description')) {
          return dioError.response!.data['error_description'];
        } else if (dioError.response!.data.containsKey('error')) {
          return dioError.response!.data['error'];
        }
        return 'Something went wrong! In Error ${dioError.response!.statusCode}';
      } else if (dioError.response!.statusCode == 404) {
        return 'Method Not Found  Status Code 404';
      } else if (dioError.response!.statusCode == 500) {
        if (dioError.response!.statusMessage == null) {
          return 'Internal Server Error!';
        }
        return dioError.response!.statusMessage ?? 'Internal Server Error!';
      }
      return ' Something went wrong!';
    } else if (dioError.type == DioExceptionType.connectionTimeout) {
      return 'Connection Timeout!';
    } else if (dioError.type == DioExceptionType.receiveTimeout) {
      return 'Receive Timeout!';
    } else if (dioError.type == DioExceptionType.sendTimeout) {
      return 'Send Timeout!';
    } else if (dioError.type == DioExceptionType.connectionTimeout) {
      return 'There is some issue with your internet connection. Please check your internet and try again.';
    }
    return 'Something went wrong!';
  }
}
