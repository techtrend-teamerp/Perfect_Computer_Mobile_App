import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:perfect_computer/api/api_urls.dart';
import 'package:perfect_computer/config/routes/app_routes.dart';
import 'package:perfect_computer/constants/app_colors.dart';
import 'package:perfect_computer/constants/common_constants.dart';
import 'package:perfect_computer/constants/images_path.dart';
import 'package:perfect_computer/modules/login/controller/login_controller.dart';
import 'package:perfect_computer/utils/helpers/app_font.dart';
import 'package:perfect_computer/utils/helpers/helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController _loginController = Get.put(LoginController());
  final TextEditingController _mobileNumberController = TextEditingController();

  @override
  void initState() {
    if (mounted) {
      WidgetsBinding.instance.addPostFrameCallback((_) {});
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.height * 0.2,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(
                    ImagesPath.appLogo,
                    width: Get.width * 0.30,
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.06,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 24,
                    color: AppColor.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                buildMobileNumberWidget(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.dashboardScreen);
                      },
                      child: Text(
                        'Get OTP',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          letterSpacing: 0.8,
                          fontSize: Get.textTheme.bodyMedium!.fontSize,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'By Signing up, you accept our ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: Get.width * 0.034,
                height: 1.2,
                letterSpacing: 0.8,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Terms of Use \n',
                  style: TextStyle(
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: Get.width * 0.034,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Helper.openWebPageUrl(
                        url: ApiUrls.termsAndConditionUrl,
                      );
                    },
                ),
                TextSpan(
                  text: ' and ',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: Get.width * 0.034,
                  ),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: Get.theme.primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: Get.width * 0.034,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Helper.openWebPageUrl(
                        url: ApiUrls.privacyPolicyUrl,
                      );
                    },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  Widget buildMobileNumberWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Text(
              'Enter Your Mobile Number',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          TextFormField(
            controller: _mobileNumberController,
            // autofocus: true,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: ' Mobile Number',
            ),
          ),
        ],
      ),
    );
  }
}
