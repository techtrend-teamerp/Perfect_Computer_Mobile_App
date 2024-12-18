import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:perfect_computer/constants/images_path.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ImagesPath.noDataFound,
            height: 200.0,
            width: 200.0,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'No Data Found!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: Get.textTheme.titleMedium!.fontSize,
            ),
          ),
        ],
      ),
    );
  }
}
