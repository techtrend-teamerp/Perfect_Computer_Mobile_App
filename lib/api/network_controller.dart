import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  //this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  RxInt connectionType = 0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _streamSubscription;
  late List<ConnectivityResult> connectivityResult;

  @override
  void onInit() {
    getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
    super.onInit();
  }

  Future<void> getConnectionType() async {

    try {
      connectivityResult = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {}
    return _updateState(connectivityResult);
  }

  _updateState(List<ConnectivityResult> result) {
    switch (result.first) {
      case ConnectivityResult.wifi:
        connectionType.value = 1;
        break;
      case ConnectivityResult.mobile:
        connectionType.value = 2;
        break;
      case ConnectivityResult.none:
        connectionType.value = 0;
        break;
      default:
        connectionType.value = 0;
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
