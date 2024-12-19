import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_computer/utils/helpers/pick_or_capture_media_util.dart';
import 'package:perfect_computer/utils/ui/ui_utils.dart';

class AddDriverController extends GetxController {
  /// following variable contain pick image data
  Rx<ImageInfoModel> selectedProfileImage = ImageInfoModel().obs;
  Rx<File> selectedLicence = File('').obs;
  final formKey = GlobalKey<FormState>();

  /// Initialize TextEditing Controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController licenceNoController = TextEditingController();

  /// Loading variable
  RxBool isInsertApiLoading = false.obs;

  /// Pass image type for pick image
  Future<void> pickImage({
    required int type,
  }) async {
    try {
      selectedProfileImage.value =
          await CommonPicker.selectImage(imageType: type, isImageCrop: true);
    } catch (e) {
      UiUtils.errorSnackBar(message: e.toString());
    }
  }

  /// Picked PDF File
  Future<void> pickPdfFile(BuildContext context) async {
    try {
      PickOrCaptureMediaUtil.pickPdfFromLocalStorage(
        context: context,
        onPdfPicked: (filePath) {
          selectedLicence.value = File(filePath);
        },
      );
    } catch (e) {
      UiUtils.errorSnackBar(message: e.toString());
    }
  }

  /// Clear image data for reset
  void clearImageData() {
    selectedProfileImage.value = ImageInfoModel();
  }

  bool get isCheckDocumentUploaded {
    if (selectedProfileImage.value.path == null &&
        selectedProfileImage.value.path!.isEmpty) {
      UiUtils.alertSnackBar(message: 'Please Select Photo');
      return false;
    } else if (selectedLicence.value.path.isEmpty) {
      UiUtils.alertSnackBar(message: 'Please Select Licence File');
      return false;
    }
    return true;
  }

  void clearAllData() {
    nameController.text = '';
    mobileNumberController.text = '';
    addressController.text = '';
    licenceNoController.text = '';
    selectedProfileImage.value = ImageInfoModel();
    selectedLicence.value = File('');
  }
}
