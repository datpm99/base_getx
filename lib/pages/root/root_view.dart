import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'root_controller.dart';
import 'widgets/bottom_navbar.dart';

class RootView extends GetView<RootController> {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.canPop,
      child: Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.selectedNav.value,
            children: controller.getPages(),
          ),
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
