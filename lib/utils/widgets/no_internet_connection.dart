import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:perfect_computer/constants/images_path.dart';

class NoInternetConnection extends StatelessWidget {
  final Function retryOnNoInternetConnection;

  const NoInternetConnection(
      {required this.retryOnNoInternetConnection, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ImagesPath.noInternetConnection,
            height: 200.0,
            width: 200.0,
          ),
          const SizedBox(
            height: 16.0,
          ),
          const Text(
            'No Internet!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Text(
            'Please check your internet connection!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          ElevatedButton(
            onPressed: () => retryOnNoInternetConnection(),
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
