import 'package:get/get.dart';
import 'package:perfect_computer/modules/dashboard/custom_widget/custom_bottom_navigation_widget.dart';
import 'package:perfect_computer/modules/dashboard/custom_widget/custom_tab_bar_widget.dart';

class DashboardController extends GetxController {
  /// variable for Tab Bar
  RxList<TabItem> availableTabs = TabItem.values.toList().obs;
  Rx<TabItem> currentTab = TabItem.purchase.obs;

  /// variable for bottom navigation tab
  RxList<BottomTabItem> availableBottomTabs = BottomTabItem.values.toList().obs;
  Rx<BottomTabItem> currentBottomTab = BottomTabItem.home.obs;

  /// on select tab bar item
  void selectTab(TabItem tabItem) {
    currentTab.value = tabItem;
  }

  /// on select bottom navigation item
  void selectBottomTab(BottomTabItem tabItem) {
    currentBottomTab.value = tabItem;
  }
}
