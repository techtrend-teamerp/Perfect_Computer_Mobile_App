import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfect_computer/constants/app_colors.dart';
import 'package:perfect_computer/constants/common_constants.dart';
import 'package:perfect_computer/constants/images_path.dart';
import 'package:perfect_computer/modules/driver/controller/add_demo_controller.dart';
import 'package:perfect_computer/utils/helpers/app_font.dart';

class AddDemoScreen extends StatefulWidget {
  const AddDemoScreen({super.key});

  @override
  State<AddDemoScreen> createState() => _AddDemoScreenState();
}

class _AddDemoScreenState extends State<AddDemoScreen> {
  /// Initialize Controller
  final AddDriverController _addDemoController = Get.put(AddDriverController());

  @override
  void dispose() {
    super.dispose();
    Get.delete<AddDriverController>();
  }

  bool get isPhotoSelected =>
      _addDemoController.selectedProfileImage.value.path != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'Add',
          style: Font.subTitle2(
            color: AppColor.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Form(
              key: _addDemoController.formKey,
              child: Column(
                children: [
                  buildProfileUploadWidget(),
                  buildNameWidget(),
                  buildMobileNumberWidget(),
                  buildAddressWidget(),
                  buildLicenceNoWidget(),
                  buildLicencePikedFileWidget(),
                  buildAddButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddButtonWidget() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8, top: 20),
        child: ElevatedButton(
          onPressed: () {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          child: const Text('Add'),
        ),
      ),
    );
  }

  Widget buildProfileUploadWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Obx(
        () => Column(
          children: [
            Stack(
              children: [
                Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.34,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                      color: Color(0XFFF6F7F7), shape: BoxShape.circle),
                  child: isPhotoSelected
                      ? Image.file(
                          File(_addDemoController
                                  .selectedProfileImage.value.path ??
                              ''),
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          ImagesPath.personImage,
                        ),
                ),
                Positioned(
                  bottom: 12,
                  right: 0,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: _openBottomSheetForImageChoose,
                    child: Container(
                      height: 34,
                      width: 34,
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.photo_camera,
                        size: 18,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                ' Add Photo',
                textAlign: TextAlign.center,
                style: Font.label2(color: AppColor.lightGrey),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNameWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Name',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: _addDemoController.nameController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              hintText: ' Name',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Name";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget buildMobileNumberWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Mobile Number',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: _addDemoController.mobileNumberController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: ' Mobile Number',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Mobile Number";
              } else if (value.length != 10) {
                return "Enter Valid Mobile Number";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget buildAddressWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Address',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: _addDemoController.addressController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.next,
            maxLines: 2,
            decoration: const InputDecoration(
              hintText: ' Address',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Address";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget buildLicenceNoWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Licence No',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: _addDemoController.licenceNoController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              hintText: ' Licence No',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter Licence No";
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget buildLicencePikedFileWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Upload Licence',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Obx(
            () => ListTile(
              tileColor: Colors.white,
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: AppColor.borderColor,
                  ),
                  borderRadius: BorderRadius.circular(
                      CommonConstants.defaultBorderRadius)),
              leading: _getSelectedLicenceFileWidget(),
              title: Text(
                _addDemoController.selectedLicence.value.path.isEmpty
                    ? 'Upload Licence Document'
                    : _addDemoController.selectedLicence.value.path
                        .split('/')
                        .last,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColor.lightGrey,
                ),
              ),
              trailing: _getClearLicenceFile(),
              onTap: () => _addDemoController.pickPdfFile(context),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openBottomSheetForImageChoose() async {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading: isPhotoSelected
                    ? Container(
                        height: 42,
                        width: 42,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.file(
                          File(
                            _addDemoController
                                    .selectedProfileImage.value.path ??
                                '',
                          ),
                          fit: BoxFit.cover,
                        ),
                      )
                    : null,
                title: const Text(
                  'Select Profile Photo',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                trailing: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: AppColor.grey.shade100,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      dense: true,
                      title: const Text(
                        'Take photo',
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.photo_camera,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        _addDemoController.pickImage(type: 1);
                      },
                    ),
                    Divider(
                      color: AppColor.borderColor,
                    ),
                    ListTile(
                      dense: true,
                      title: const Text(
                        'Choose photo',
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.photo,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        _addDemoController.pickImage(type: 0);
                      },
                    ),
                    isPhotoSelected
                        ? _getDeletePhotoWidget(context)
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getDeletePhotoWidget(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: AppColor.borderColor,
        ),
        ListTile(
          dense: true,
          title: const Text(
            'Delete photo',
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
          trailing: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onTap: () {
            Navigator.of(context).pop();
            _addDemoController.clearImageData();
          },
        )
      ],
    );
  }

  _getSelectedLicenceFileWidget() {
    return _addDemoController.selectedLicence.value.path.isNotEmpty
        ? const Icon(Icons.picture_as_pdf)
        : null;
  }

  Widget _getClearLicenceFile() {
    return _addDemoController.selectedLicence.value.path.isNotEmpty
        ? IconButton(
            onPressed: () {
              _addDemoController.selectedLicence.value = File('');
            },
            icon: const Icon(Icons.close),
          )
        : const Icon(Icons.upload);
  }
}
