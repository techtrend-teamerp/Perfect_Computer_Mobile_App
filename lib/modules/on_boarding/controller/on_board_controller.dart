import 'package:get/get.dart';
import 'package:perfect_computer/constants/images_path.dart';
import 'package:perfect_computer/modules/on_boarding/model/onboard_data_model.dart';

class OnBoardController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isErrorOccur = false.obs;
  RxList<OnBoardDataList> onBoarData = <OnBoardDataList>[].obs;

  void setOnBoardData() {
    onBoarData.value = [
      OnBoardDataList(
          title: 'A computer processes, stores, and retrieves data efficiently.',
          image: ImagesPath.onBoarding1,
          description:
              'Computer accessories are essential peripherals that enhance computer functionality and user experience. They include input devices like keyboards and mice, output devices such as monitors and printers, and storage solutions like external hard drives, all aimed at improving productivity and comfort.'),
      OnBoardDataList(
          title: 'A computer processes, stores, and retrieves data efficiently.',
          image: ImagesPath.onBoarding2,
          description:
              'Computer accessories are essential peripherals that enhance computer functionality and user experience. They include input devices like keyboards and mice, output devices such as monitors and printers, and storage solutions like external hard drives, all aimed at improving productivity and comfort.'),
      OnBoardDataList(
          title: 'A computer processes, stores, and retrieves data efficiently.',
          image: ImagesPath.onBoarding3,
          description:
              'Computer accessories are essential peripherals that enhance computer functionality and user experience. They include input devices like keyboards and mice, output devices such as monitors and printers, and storage solutions like external hard drives, all aimed at improving productivity and comfort.'),
    ];
  }
}
