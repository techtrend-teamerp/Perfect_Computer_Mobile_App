import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perfect_computer/constants/app_colors.dart';
import 'package:perfect_computer/constants/common_constants.dart';
import 'package:perfect_computer/utils/helpers/helper.dart';
import 'package:perfect_computer/utils/helpers/permission_util.dart';
import 'package:perfect_computer/utils/ui/app_dialogs.dart';
import 'package:perfect_computer/utils/ui/ui_utils.dart';

class PickOrCaptureMediaUtil {
  static final ImagePicker _picker = ImagePicker();

  static void captureImage({
    required BuildContext context,
    required Function onImageCaptured,
  }) async {
    bool permissionResult = await PermissionUtil.hasCameraPermission(
      context: context,
    );
    if (permissionResult) {
      _picker
          .pickImage(
        source: ImageSource.camera,
        imageQuality: CommonConstants.capturedImageQuality,
      )
          .then((xFile) {
        if (xFile != null) {
          double capturedImgSizeInMb = Helper.getFileSizeInMb(
            filePath: xFile.path,
          );
          if (capturedImgSizeInMb > CommonConstants.imageUploadSizeInMb) {
            UiUtils.errorSnackBar(
                    message:
                        'Image Size Must Be Less Then Or Equal To ${CommonConstants.imageUploadSizeInMb}MB (<=${CommonConstants.imageUploadSizeInMb}MB)')
                .show();
            return;
          } else {
            onImageCaptured(xFile);
            return;
          }
        }
        return;
      }).catchError(
        (error) {
          AppDialogs.showInformationDialogue(
            context: context,
            description: error.toString(),
            onOkBntClick: () => Get.back(),
            barrierDismissible: true,
          );
          return;
        },
      );
    }
  }

  static void pickImageFromGallery({
    required BuildContext context,
    required Function onImagePicked,
  }) async {
    bool permissionResult =
        await PermissionUtil.hasPhotosPermission(context: context);
    if (permissionResult) {
      _picker
          .pickImage(
        source: ImageSource.gallery,
        imageQuality: CommonConstants.pickedImageQuality,
      )
          .then((xFile) {
        if (xFile != null) {
          double pickedImgSizeInMb = Helper.getFileSizeInMb(
            filePath: xFile.path,
          );
          if (pickedImgSizeInMb > CommonConstants.imageUploadSizeInMb) {
            UiUtils.errorSnackBar(
                    message:
                        'Image Size Must Be Less Then Or Equal To ${CommonConstants.imageUploadSizeInMb}MB (<=${CommonConstants.imageUploadSizeInMb}MB)')
                .show();
            return;
          } else {
            onImagePicked(xFile);
            return;
          }
        }
        return;
      }).catchError(
        (error) {
          AppDialogs.showInformationDialogue(
            context: context,
            description: error.toString(),
            onOkBntClick: () => Get.back(),
            barrierDismissible: true,
          );
          return;
        },
      );
    }
  }

  static void pickPdfFromLocalStorage({
    required BuildContext context,
    required Function onPdfPicked,
  }) async {
    // bool permissionResult = await PermissionUtil.hasPhotosPermission(
    //   context: context,
    // );
    if (true) {
      await FilePicker.platform.pickFiles().then((value) {
        if (value != null) {
          String filePath = value.files.single.path!;
          double pickedPdfSizeInMb = Helper.getFileSizeInMb(
            filePath: filePath,
          );
          if (pickedPdfSizeInMb > CommonConstants.pdfUploadSizeInMb) {
            UiUtils.errorSnackBar(
                    message:
                        'PDF Size Must Be Less Then Or Equal To ${CommonConstants.pdfUploadSizeInMb}MB (<=${CommonConstants.imageUploadSizeInMb}MB)')
                .show();
            return;
          } else {
            onPdfPicked(filePath);
            return;
          }
        } else {
          return;
        }
      }).catchError(
        (error) {
          AppDialogs.showInformationDialogue(
            context: context,
            description: error.toString(),
            onOkBntClick: () => Get.back(),
            barrierDismissible: true,
          );
          return;
        },
      );
    }
  }

  static void pickVideoFromGallery({
    required BuildContext context,
    required Function onVideoPicked,
  }) async {
    bool permissionResult =
        await PermissionUtil.hasVideoPermission(context: context);
    if (permissionResult) {
      _picker
          .pickVideo(
        source: ImageSource.gallery,
      )
          .then((xFile) {
        if (xFile != null) {
          double pickedVideoSizeInMb = Helper.getFileSizeInMb(
            filePath: xFile.path,
          );
          if (pickedVideoSizeInMb > CommonConstants.videoUploadSizeInMb) {
            UiUtils.errorSnackBar(
                    message:
                        'Video Size Must Be Less Then Or Equal To ${CommonConstants.videoUploadSizeInMb}MB')
                .show();
            return;
          } else {
            onVideoPicked(xFile);
            return;
          }
        }
        return;
      }).catchError(
        (error) {
          AppDialogs.showInformationDialogue(
            context: context,
            description: error.toString(),
            onOkBntClick: () => Get.back(),
            barrierDismissible: true,
          );
          return;
        },
      );
    }
  }
}

class CommonPicker {
  // todo : imagePicker method

  static final ImagePicker _picker = ImagePicker();
  static final ImageCropper _imageCropper = ImageCropper();

  /// 0 means [Gallery] || 1 Means [Camera]
  /// by default pass 0
  static Future<ImageInfoModel> selectImage({
    int imageType = 0,
    bool isImageCrop = false,
  }) async {
    File? pikedFile;

    List<ImageSource> source = [ImageSource.gallery, ImageSource.camera];

    var pickedImage = await _picker.pickImage(
        source: source[imageType], preferredCameraDevice: CameraDevice.rear);

    if (pickedImage != null) {
      pikedFile = File(pickedImage.path);

      /// Check image is crop
      if (isImageCrop) {
        pikedFile = (await cropImage(path: pickedImage.path));
      }
    }

    if (pikedFile != null) {
      String ext = pikedFile.path.split('/').last.split('.').last;
      final name = "Image_${DateTime.now().microsecondsSinceEpoch}.$ext";
      File createdFile = File(pikedFile.path);
      File fileBytes = File(pikedFile.path);
      final imgByte = fileBytes.readAsBytesSync();
      final String base64 = base64Encode(imgByte);
      final bytes = fileBytes.readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      final mb = kb / 1024;
      if (mb <= 8) {
        return ImageInfoModel(
          name: name,
          ext: ext,
          file: createdFile,
          path: pikedFile.path,
          forUploadByte: base64,
        );
      } else {
        UiUtils.errorSnackBar(
            message: "Please Reselect File Size More then 8 MB");

        return ImageInfoModel(name: "No File Chosen!");
      }
    } else {
      return ImageInfoModel(name: "No File Chosen!");
    }
  }

  // Todo : choose pdf or images
  static Future<ImageInfoModel> chooseFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'doc', 'mp4', ''],
      );

      if (result != null) {
        if (result.files.isEmpty) {
          return ImageInfoModel(name: "No File Chosen!");
        }
        var pickedFile = result.files.first;
        if (pickedFile.path == null) {
          return ImageInfoModel(name: "No File Chosen!");
        }
        String ext = pickedFile.path != null
            ? pickedFile.path!.split('/').last.split('.').last
            : "";
        final name = "000${DateTime.now().microsecondsSinceEpoch}.$ext";
        File createdFile = File(pickedFile.path!);
        File fileBytes = File(pickedFile.path!);

        final imgByte = fileBytes.readAsBytesSync();
        final String base64 = base64Encode(imgByte);
        final bytes = fileBytes.readAsBytesSync().lengthInBytes;

        final kb = bytes / 1024;
        final mb = kb / 1024;
        if (mb <= 8) {
          return ImageInfoModel(
              name: name,
              ext: ext,
              file: createdFile,
              path: pickedFile.path,
              forUploadByte: base64);
        } else {
          UiUtils.errorSnackBar(
              message: "Please Reselect File Size More then 8 MB");
          return ImageInfoModel(name: "No File Chosen!");
        }
      } else {
        return ImageInfoModel(name: "No File Chosen!");
      }
    } catch (error) {
      return ImageInfoModel(name: "No File Chosen!");
    }
  }

  /// Crop image as a Square
  static Future<File?> cropImage({
    required String path,
  }) async {
    CroppedFile? croppedFile = await _imageCropper.cropImage(
      sourcePath: path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: AppColor.primaryColor,
          toolbarWidgetColor: AppColor.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
          hideBottomControls: true,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          title: 'Crop Image',
          aspectRatioLockEnabled: true,
          minimumAspectRatio: 1.0,
          rotateButtonsHidden: true,
          // Disable rotation controls
          rotateClockwiseButtonHidden: true,
          // Disable clockwise rotation button
          resetButtonHidden: true, // Disable the reset button
        ),
      ],
    );
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }
}

class ImageInfoModel {
  File? file;
  String? name;
  String? ext;
  int? size;
  String? path;
  String? forUploadByte;

  ImageInfoModel({
    this.file,
    this.name,
    this.ext,
    this.size,
    this.path,
    this.forUploadByte,
  });
}
