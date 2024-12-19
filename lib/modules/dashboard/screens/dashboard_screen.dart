import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_computer/constants/app_colors.dart';
import 'package:perfect_computer/modules/dashboard/controller/dashboard_controller.dart';
import 'package:perfect_computer/modules/dashboard/custom_widget/custom_bottom_navigation_widget.dart';
import 'package:perfect_computer/modules/dashboard/screens/home_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _getAppBarTitle,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: Badge.count(
                count: 0,
                child: const Icon(Icons.notifications),
              ),
            ),
          )
        ],
      ),
      body: Obx(
        () => _buildTabContent(),
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomTabBar(
          availableTabs: _dashboardController.availableBottomTabs,
          currentTab: _dashboardController.currentBottomTab.value,
          onSelectTab: _dashboardController.selectBottomTab,
        ),
      ),
    );
  }

  Widget get _getAppBarTitle {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Perfect ',
        style: TextStyle(
          fontSize: 17,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.9,
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Computer',
            style: TextStyle(
              fontSize: 17,
              color: AppColor.secondaryColor,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.9,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_dashboardController.currentBottomTab.value) {
      case BottomTabItem.home:
        return const HomeScreen();
      case BottomTabItem.reports:
        return const Center(child: Text("This is the my report page"));
      case BottomTabItem.profile:
        return const Center(child: Text("This is the profile page"));
    }
  }
}
