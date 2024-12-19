import 'package:flutter/material.dart';
import 'package:perfect_computer/constants/app_colors.dart';
import 'package:perfect_computer/utils/helpers/app_font.dart';

/// enum for Bottom Tab Bar Item
enum BottomTabItem { home, reports, profile }

extension TabItemExtension on BottomTabItem {
  String get name {
    switch (this) {
      case BottomTabItem.home:
        return 'Home';
      case BottomTabItem.reports:
        return 'Reports';
      case BottomTabItem.profile:
        return 'My Profile';
    }
  }

  IconData get icon {
    switch (this) {
      case BottomTabItem.home:
        return Icons.home;
      case BottomTabItem.reports:
        return Icons.file_copy;
      case BottomTabItem.profile:
        return Icons.person;
    }
  }
}

/// Custom Bottom Tab Bar Widget Code Started here
class CustomBottomTabBar extends StatelessWidget {
  final List<BottomTabItem> availableTabs;
  final BottomTabItem currentTab;
  final ValueChanged<BottomTabItem> onSelectTab;

  const CustomBottomTabBar({
    super.key,
    required this.availableTabs,
    required this.currentTab,
    required this.onSelectTab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 70,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        maxWidth: double.infinity,
        minHeight: 50,
        maxHeight: 66,
      ),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(color: AppColor.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          spreadRadius: -1,
          blurRadius: 2,
          offset: const Offset(0, -5),
        )
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: availableTabs.map((tab) {
          final bool isSelected = tab == currentTab;
          return Material(
            borderRadius: BorderRadius.circular(12),
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: () => onSelectTab(tab),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      tab.icon,
                      color:
                          isSelected ? AppColor.primaryColor : AppColor.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        tab.name,
                        style: Font.label2(
                          color: isSelected
                              ? AppColor.primaryColor
                              : AppColor.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
