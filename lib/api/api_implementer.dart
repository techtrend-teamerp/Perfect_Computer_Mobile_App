import 'dart:convert';

import 'package:perfect_computer/api/custom_http_exception.dart';
import 'package:perfect_computer/api/dio_client.dart';
import 'package:perfect_computer/api/model/api_response_model.dart';
import 'package:perfect_computer/modules/on_boarding/model/check_version_model.dart';
import 'package:perfect_computer/utils/helpers/helper.dart';

class ApiImplementer {
  static String deviceId = '1';
  static String userId = '1';

  static Future<ApiResponse<List<CheckVersion>>> checkVersionApiCall({
    required String version,
    required int appType,
  }) async {
    try {
      final response = await DioClient.getDioClient()!.get(
        'check_version',
        queryParameters: {
          "device_id": deviceId,
          "version": version,
          "app_type": appType,
        },
      );

      Helper.log(response.realUri);
      Helper.log(response.data);

      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.data), (data) {
          return (data as List).map((e) => CheckVersion.fromJson(e)).toList();
        });
      } else {
        throw CustomHttpException(
            errMessage: response.statusMessage.toString());
      }
    } catch (error) {
      rethrow;
    }
  }
}
