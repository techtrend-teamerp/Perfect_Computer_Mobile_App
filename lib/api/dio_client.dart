import 'package:dio/dio.dart';
import 'package:perfect_computer/api/api_urls.dart';
import 'package:perfect_computer/constants/common_constants.dart';

class DioClient {
  static Dio? _dio;

  static Dio? getDioClient() {
    if (_dio == null) {
      _dio = Dio();
      _dio!.options.baseUrl = ApiUrls.baseUrl;
      _dio!.options.connectTimeout =
          CommonConstants.connectionTimeOutDuration;
      _dio!.options.receiveTimeout =
          CommonConstants.receiveTimeOutDuration;
    }
    return _dio;
  }
}
