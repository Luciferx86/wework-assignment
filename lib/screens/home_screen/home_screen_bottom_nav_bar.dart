import 'package:flutter/material.dart';
import 'package:wework/enums/bottom_nav_item_type.dart';
import 'package:wework/utils/common_utils.dart';

class HomeScreenBottomNavBar extends StatelessWidget {
  final Function(int) onChange;
  final int selectedIndex;
  const HomeScreenBottomNavBar({
    required this.selectedIndex,
    required this.onChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: BottomNavItemType.values
          .map((e) => bottomNavBarItemGenerator(itemType: e))
          .toList(),
      currentIndex: selectedIndex,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      onTap: onChange,
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  BottomNavigationBarItem bottomNavBarItemGenerator({
    required BottomNavItemType itemType,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Image.asset(
          itemType.unSelectedPath,
          height: 22,
          width: 22,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Image.asset(
          itemType.selectedPath,
          height: 22,
          width: 22,
        ),
      ),
      label: CommonUtils.capitalizeString(itemType.title),
    );
  }
}
