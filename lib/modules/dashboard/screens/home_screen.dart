import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:perfect_computer/modules/dashboard/controller/dashboard_controller.dart';
import 'package:perfect_computer/modules/dashboard/custom_widget/custom_tab_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DashboardController _dashboardController =
      Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Obx(
          () => Column(
            children: [
              /// TabBar starting here
              CustomTabBar(
                availableTabs: _dashboardController.availableTabs,
                currentTab: _dashboardController.currentTab.value,
                onSelectTab: _dashboardController.selectTab,
              ),

              /// Main content stating here
              Expanded(
                child: _buildTabContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_dashboardController.currentTab.value) {
      case TabItem.purchase:
        return const Center(child: Text("This is the Purchase page"));
      case TabItem.sales:
        return const Center(child: Text("This is the Sales page"));
      case TabItem.expense:
        return const Center(child: Text("This is the Expense page"));
    }
  }
}
