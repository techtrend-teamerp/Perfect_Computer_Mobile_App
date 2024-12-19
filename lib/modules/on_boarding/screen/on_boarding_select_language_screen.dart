import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_computer/config/routes/app_routes.dart';
import 'package:perfect_computer/constants/app_colors.dart';
import 'package:perfect_computer/constants/common_constants.dart';
import 'package:perfect_computer/constants/images_path.dart';
import 'package:perfect_computer/utils/helpers/app_font.dart';
import 'package:perfect_computer/utils/ui/ui_utils.dart';

enum LanguageEnum {
  english,
  hindi,
  marathi,
  gujarati,
  telugu,
  kannada,
  bengali,
  tamil
}

class OnBoardingSelectLanguagesScreen extends StatefulWidget {
  const OnBoardingSelectLanguagesScreen({super.key});

  @override
  State<OnBoardingSelectLanguagesScreen> createState() =>
      _OnBoardingSelectLanguagesScreenState();
}

class _OnBoardingSelectLanguagesScreenState
    extends State<OnBoardingSelectLanguagesScreen> {
  final Rx<LanguageEnum> _selectedLanguage =
      Rx<LanguageEnum>(LanguageEnum.english);
  String? selectedLocale =
      Get.deviceLocale != null ? Get.locale!.languageCode : 'en';

  @override
  void initState() {
    try {
      _selectedLanguage.value = selectedLocale == null
          ? LanguageEnum.english
          : selectedLocale == 'en'
              ? LanguageEnum.english
              : LanguageEnum.hindi;
    } catch (error) {
      error.printError();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text(
          'select_language'.tr,
          style: Font.subTitle2(
            color: AppColor.black,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _checkLanguage(
                            languageEnum: LanguageEnum.english,
                          );
                        },
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: Card(
                          elevation: 2.0,
                          color: _selectedLanguage.value == LanguageEnum.english
                              ? CommonConstants.primaryColor.shade50
                              : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            side:
                                _selectedLanguage.value == LanguageEnum.english
                                    ? BorderSide(
                                        color: Get.theme.primaryColor,
                                        width: 1,
                                      )
                                    : BorderSide.none,
                          ),
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                            ),
                            leading: Image.asset(
                              ImagesPath.indiaFlag,
                              height: 30.0,
                              width: 30.0,
                            ),
                            title: const Text('English'),
                            subtitle: Text(
                              'English (US)',
                              style: TextStyle(
                                color: _selectedLanguage.value ==
                                        LanguageEnum.english
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.check_circle_outline_rounded,
                              color: _selectedLanguage.value ==
                                      LanguageEnum.english
                                  ? Get.theme.primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _checkLanguage(languageEnum: LanguageEnum.hindi);
                        },
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: Card(
                          color: _selectedLanguage.value == LanguageEnum.hindi
                              ? CommonConstants.primaryColor.shade50
                              : Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            side: _selectedLanguage.value == LanguageEnum.hindi
                                ? BorderSide(
                                    color: Get.theme.primaryColor,
                                    width: 1,
                                  )
                                : BorderSide.none,
                          ),
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                            ),
                            leading: Image.asset(
                              ImagesPath.indiaFlag,
                              width: 30.0,
                              height: 30.0,
                            ),
                            title: const Text('हिन्दी'),
                            subtitle: Text(
                              'हिन्दी (IN)',
                              style: TextStyle(
                                color: _selectedLanguage.value ==
                                        LanguageEnum.hindi
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.check_circle_outline_rounded,
                              color:
                                  _selectedLanguage.value == LanguageEnum.hindi
                                      ? Get.theme.primaryColor
                                      : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _checkLanguage(languageEnum: LanguageEnum.marathi);
                        },
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: Card(
                          color: _selectedLanguage.value == LanguageEnum.marathi
                              ? CommonConstants.primaryColor.shade50
                              : Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            side:
                                _selectedLanguage.value == LanguageEnum.marathi
                                    ? BorderSide(
                                        color: Get.theme.primaryColor,
                                        width: 1,
                                      )
                                    : BorderSide.none,
                          ),
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                            ),
                            leading: Image.asset(
                              ImagesPath.indiaFlag,
                              width: 30.0,
                              height: 30.0,
                            ),
                            title: const Text('मराठी'),
                            subtitle: Text(
                              'मराठी (IN)',
                              style: TextStyle(
                                color: _selectedLanguage.value ==
                                        LanguageEnum.marathi
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.check_circle_outline_rounded,
                              color: _selectedLanguage.value ==
                                      LanguageEnum.marathi
                                  ? Get.theme.primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _checkLanguage(languageEnum: LanguageEnum.gujarati);
                        },
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: Card(
                          color:
                              _selectedLanguage.value == LanguageEnum.gujarati
                                  ? CommonConstants.primaryColor.shade50
                                  : Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            side:
                                _selectedLanguage.value == LanguageEnum.gujarati
                                    ? BorderSide(
                                        color: Get.theme.primaryColor,
                                        width: 1,
                                      )
                                    : BorderSide.none,
                          ),
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                            ),
                            leading: Image.asset(
                              ImagesPath.indiaFlag,
                              width: 30.0,
                              height: 30.0,
                            ),
                            title: const Text('ગુજરાતી'),
                            subtitle: Text(
                              'ગુજરાતી (IN)',
                              style: TextStyle(
                                color: _selectedLanguage.value ==
                                        LanguageEnum.gujarati
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.check_circle_outline_rounded,
                              color: _selectedLanguage.value ==
                                      LanguageEnum.gujarati
                                  ? Get.theme.primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _checkLanguage(languageEnum: LanguageEnum.telugu);
                        },
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: Card(
                          color: _selectedLanguage.value == LanguageEnum.telugu
                              ? CommonConstants.primaryColor.shade50
                              : Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            side: _selectedLanguage.value == LanguageEnum.telugu
                                ? BorderSide(
                                    color: Get.theme.primaryColor,
                                    width: 1,
                                  )
                                : BorderSide.none,
                          ),
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                            ),
                            leading: Image.asset(
                              ImagesPath.indiaFlag,
                              width: 30.0,
                              height: 30.0,
                            ),
                            title: const Text('తెలుగు'),
                            subtitle: Text(
                              'తెలుగు (IN)',
                              style: TextStyle(
                                color: _selectedLanguage.value ==
                                        LanguageEnum.telugu
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.check_circle_outline_rounded,
                              color:
                                  _selectedLanguage.value == LanguageEnum.telugu
                                      ? Get.theme.primaryColor
                                      : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _checkLanguage(languageEnum: LanguageEnum.kannada);
                        },
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: Card(
                          color: _selectedLanguage.value == LanguageEnum.kannada
                              ? CommonConstants.primaryColor.shade50
                              : Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            side:
                                _selectedLanguage.value == LanguageEnum.kannada
                                    ? BorderSide(
                                        color: Get.theme.primaryColor,
                                        width: 1,
                                      )
                                    : BorderSide.none,
                          ),
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                            ),
                            leading: Image.asset(
                              ImagesPath.indiaFlag,
                              width: 30.0,
                              height: 30.0,
                            ),
                            title: const Text('ಕನ್ನಡ'),
                            subtitle: Text(
                              'ಕನ್ನಡ (IN)',
                              style: TextStyle(
                                color: _selectedLanguage.value ==
                                        LanguageEnum.kannada
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.check_circle_outline_rounded,
                              color: _selectedLanguage.value ==
                                      LanguageEnum.kannada
                                  ? Get.theme.primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _checkLanguage(languageEnum: LanguageEnum.bengali);
                        },
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: Card(
                          color: _selectedLanguage.value == LanguageEnum.bengali
                              ? CommonConstants.primaryColor.shade50
                              : Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            side:
                                _selectedLanguage.value == LanguageEnum.bengali
                                    ? BorderSide(
                                        color: Get.theme.primaryColor,
                                        width: 1,
                                      )
                                    : BorderSide.none,
                          ),
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                            ),
                            leading: Image.asset(
                              ImagesPath.indiaFlag,
                              width: 30.0,
                              height: 30.0,
                            ),
                            title: const Text('বাংলা'),
                            subtitle: Text(
                              'বাংলা (IN)',
                              style: TextStyle(
                                color: _selectedLanguage.value ==
                                        LanguageEnum.bengali
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.check_circle_outline_rounded,
                              color: _selectedLanguage.value ==
                                      LanguageEnum.bengali
                                  ? Get.theme.primaryColor
                                  : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          _checkLanguage(languageEnum: LanguageEnum.tamil);
                        },
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        child: Card(
                          color: _selectedLanguage.value == LanguageEnum.tamil
                              ? CommonConstants.primaryColor.shade50
                              : Colors.white,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              8.0,
                            ),
                            side: _selectedLanguage.value == LanguageEnum.tamil
                                ? BorderSide(
                                    color: Get.theme.primaryColor,
                                    width: 1,
                                  )
                                : BorderSide.none,
                          ),
                          margin: EdgeInsets.zero,
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                8.0,
                              ),
                            ),
                            leading: Image.asset(
                              ImagesPath.indiaFlag,
                              width: 30.0,
                              height: 30.0,
                            ),
                            title: const Text('தமிழ்'),
                            subtitle: Text(
                              'தமிழ் (IN)',
                              style: TextStyle(
                                color: _selectedLanguage.value ==
                                        LanguageEnum.tamil
                                    ? Get.theme.primaryColor
                                    : Colors.grey,
                              ),
                            ),
                            trailing: Icon(
                              Icons.check_circle_outline_rounded,
                              color:
                                  _selectedLanguage.value == LanguageEnum.tamil
                                      ? Get.theme.primaryColor
                                      : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'continue'.tr.toUpperCase(),
        ),
        onPressed: () => Get.toNamed(AppRoutes.onBoardingScreen),
      ),
    );
  }

  void _checkLanguage({
    required LanguageEnum languageEnum,
  }) async {
    try {
      _selectedLanguage.value = languageEnum;
      var locale = _selectedLanguage.value == LanguageEnum.hindi
          ? const Locale('hi', 'IN')
          : _selectedLanguage.value == LanguageEnum.marathi
              ? const Locale('mr', 'IN')
              : _selectedLanguage.value == LanguageEnum.gujarati
                  ? const Locale('gj', 'IN')
                  : _selectedLanguage.value == LanguageEnum.telugu
                      ? const Locale('tl', 'IN')
                      : _selectedLanguage.value == LanguageEnum.kannada
                          ? const Locale('kn', 'IN')
                          : _selectedLanguage.value == LanguageEnum.bengali
                              ? const Locale('bn', 'IN')
                              : _selectedLanguage.value == LanguageEnum.tamil
                                  ? const Locale('tm', 'IN')
                                  : const Locale('en', 'US');
      await Get.updateLocale(locale);
    } catch (error) {
      UiUtils.errorSnackBar(message: '$error').show();
    }
  }
}
