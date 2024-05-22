import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';
import 'home_controller.dart';
import 'widgets/base_list_item.dart';
import 'widgets/drawer_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        elevation: 0.5,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: Text('Base GetX', style: Styles.normalTextW700(size: 20)),
        actions: [
          Image.asset('assets/images/logo.png', width: 45, height: 45),
          const SizedBox(width: 10),
        ],
      ),
      body: BaseListItem(
        lstObj: controller.lstUtil,
        onTab: controller.onNavigator,
      ),
      drawer: const DrawerView(),
    );
  }
}
