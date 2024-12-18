import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:perfect_computer/constants/app_colors.dart';
import 'package:perfect_computer/utils/helpers/app_font.dart';

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        Image.asset(
          image,
          fit: BoxFit.fill,
        ),
        // FadeInImage(
        //   placeholder: const AssetImage(ImagesPath.bannerIcon),
        //   image: NetworkImage(image),
        //   fit: BoxFit.fill,
        //   // width: Get.width * 0.9,
        //   // height: Get.height * 0.36,
        // ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Font.subTitle1(
            color: AppColor.black,
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: Font.label2(
            color: AppColor.lightGrey,
          ),
        ),
        // const Spacer(),
        const SizedBox(
          height: 42,
        )
      ],
    );
  }
}

// Dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 4,
      width: Get.width * 0.08,
      decoration: BoxDecoration(
        color: isActive ? AppColor.primaryColor : AppColor.lightGrey,
        // border: isActive ? null : Border.all(color: AppColor.primaryColor),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}
