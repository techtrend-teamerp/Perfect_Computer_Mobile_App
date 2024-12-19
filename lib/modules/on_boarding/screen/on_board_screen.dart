import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_computer/config/routes/app_routes.dart';
import 'package:perfect_computer/constants/app_colors.dart';
import 'package:perfect_computer/modules/on_boarding/controller/on_board_controller.dart';
import 'package:perfect_computer/modules/on_boarding/custom_widget/on_board_content.dart';
import 'package:perfect_computer/utils/helpers/app_font.dart';
import 'package:perfect_computer/utils/widgets/loading_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final OnBoardController _onBoardController = Get.put(OnBoardController());

  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _onBoardController.setOnBoardData();

    // Initialize page controller
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _onBoardController.isLoading.value
          ? const LoadingWidget()
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  _getCarouselWidget(),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _getDotIndicator(),
                        _pageIndex != (_onBoardController.onBoarData.length - 1)
                            ? _getSkipAndNextButton()
                            : _getStartedButton(),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget _getCarouselWidget() {
    return Expanded(
      child: PageView.builder(
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        itemCount: _onBoardController.onBoarData.length,
        controller: _pageController,
        itemBuilder: (context, index) => OnBoardContent(
          title: _onBoardController.onBoarData[index].title,
          description: _onBoardController.onBoarData[index].description,
          image: _onBoardController.onBoarData[index].image,
        ),
      ),
    );
  }

  Widget _getStartedButton() {
    return ElevatedButton(
      onPressed: () {
        Get.toNamed(AppRoutes.loginScreen);
      },
      child: const Text(
        'Get Started',
      ),
    );
  }

  Widget _getSkipAndNextButton() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 18),
          child: TextButton(
            onPressed: () {
              _pageIndex = _onBoardController.onBoarData.length;
              _pageController.animateToPage(
                _pageIndex,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeIn,
              );
            },
            child: Text(
              'Skip',
              style: Font.bodyText1(color: AppColor.primaryColor),
            ),
          ),
        ),
        CircleAvatar(
          child: IconButton(
            onPressed: () {
              if (_pageIndex < 6) {
                _pageIndex++;
              }
              _pageController.animateToPage(
                _pageIndex,
                duration: const Duration(milliseconds: 350),
                curve: Curves.easeIn,
              );
            },
            icon: Icon(
              Icons.east,
              color: AppColor.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _getDotIndicator() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...List.generate(
            _onBoardController.onBoarData.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 4),
              child: DotIndicator(
                isActive: index == _pageIndex,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
