import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:perfect_computer/constants/app_colors.dart';
import 'package:perfect_computer/utils/helpers/app_font.dart';

/// enum for Tab Bar Item
enum TabItem { purchase, sales, expense }

extension TabItemExtension on TabItem {
  String get name {
    switch (this) {
      case TabItem.purchase:
        return 'Purchase';
      case TabItem.sales:
        return 'Sales';
      case TabItem.expense:
        return 'Expense';
    }
  }
}

/// Custom Tab Bar Widget Code Started here
class CustomTabBar extends StatelessWidget {
  final List<TabItem> availableTabs;
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  const CustomTabBar({
    super.key,
    required this.availableTabs,
    required this.currentTab,
    required this.onSelectTab,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      primary: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: availableTabs.map((tab) {
          final bool isSelected = tab == currentTab;
          return Padding(
            padding: const EdgeInsets.all(6),
            child: Material(
              color: isSelected
                  ? AppColor.primaryColor
                  : AppColor.primaryColor.shade50,
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () => onSelectTab(tab),
                child: Container(
                  constraints: BoxConstraints(
                    minWidth: Get.width * 0.28,
                    maxWidth: double.infinity,
                  ),
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  child: Text(
                    tab.name,
                    textAlign: TextAlign.center,
                    style: Font.label1(
                        color: isSelected ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
