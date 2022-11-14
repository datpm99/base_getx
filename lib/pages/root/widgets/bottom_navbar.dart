import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/const/import_const.dart';
import '/pages/root/root_controller.dart';

class BottomNavBar extends GetView<RootController> {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = controller.lstNav
        .map(
          (e) => BottomNavigationBarItem(
            label: e.name.tr,
            icon: Image.asset(e.icon, width: 24, color: Colors.grey),
            activeIcon: Image.asset(e.iconActive, width: 24, color: Styles.blue4),
            backgroundColor: Colors.white,
          ),
        )
        .toList();
    return Obx(
      () => BottomNavigationBar(
        items: items,
        elevation: 8,
        iconSize: 18,
        //type: BottomNavigationBarType.fixed,
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        backgroundColor: Colors.white,
        onTap: controller.onTapNav,
        currentIndex: controller.selectedNav.value,
        selectedItemColor: Styles.blue4,
        unselectedItemColor: Styles.grey13,
        unselectedLabelStyle: Styles.normalText(size: 10),
        selectedLabelStyle: Styles.smallTextW500(),
      ),
    );
  }
}
