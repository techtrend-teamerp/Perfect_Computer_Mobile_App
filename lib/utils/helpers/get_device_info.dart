//
//
// import 'package:perfect_computer/utils/helpers/preference_obj.dart';
//
// class GetDeviceInfo {
//   static Future<String> getDeviceId() async {
//     try {
//       String? deviceId = PreferenceObj.getDeviceId;
//       if (deviceId == null || deviceId.isEmpty) {
//         deviceId =
//             await FirebaseInstallations.instance.getId();
//         await PreferenceObj.setDeviceId(deviceId: deviceId);
//         return deviceId;
//       }
//       return deviceId;
//     } catch (error) {
//       String deviceId = const Uuid().v1();
//       await PreferenceObj.setDeviceId(deviceId: deviceId);
//       return deviceId;
//     }
//   }
// }
