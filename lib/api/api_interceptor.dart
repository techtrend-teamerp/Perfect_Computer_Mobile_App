import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:perfect_computer/config/routes/app_routes.dart';
import 'package:perfect_computer/utils/helpers/preference_obj.dart';

class ApiInterceptor extends InterceptorsWrapper {
  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   options.headers["Authorization"] =
  //       "${PreferenceObj.getTokenType} ${PreferenceObj.getAccessToken}";
  //   return handler.next(options);
  // }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.badResponse && err.response!.statusCode == 401) {
      PreferenceObj.clearPreferenceDataAndLogout();
      Get.offAllNamed(
        AppRoutes.dashboardScreen,
      );
      return handler.next(err);
    }
    return handler.next(err);
  }
}
