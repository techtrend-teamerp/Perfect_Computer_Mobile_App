import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:perfect_computer/constants/images_path.dart';

class SomethingWentWrongWidget extends StatelessWidget {
  final String errorTxt;
  final VoidCallback retryOnSomethingWentWrong;

  const SomethingWentWrongWidget({
    required this.retryOnSomethingWentWrong,
    this.errorTxt = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ImagesPath.somethingWentWrong,
            height: 200.0,
            width: 200.0,
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            errorTxt.isEmpty ? 'Something went wrong...' : errorTxt,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
            onPressed: () => retryOnSomethingWentWrong(),
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
