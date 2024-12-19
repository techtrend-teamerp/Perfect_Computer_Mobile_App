import 'package:get/get.dart';
import 'package:perfect_computer/api/network_controller.dart';

class NetworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
  }
}