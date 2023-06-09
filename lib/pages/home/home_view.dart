import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import 'home_controller.dart';
import 'widgets/base_list_item.dart';
import 'widgets/cus_tab.dart';
import 'widgets/drawer_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: false,
        title: Text('Base GetX', style: Styles.normalTextW700(size: 20)),
        actions: [
          Image.asset('assets/images/logo.png', width: 45, height: 45)
              .pOnly(right: 10),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              const CusTab(text: 'Material', tab: 0).expand(),
              const CusTab(text: 'Cupertino', tab: 1, borderLeft: true)
                  .expand(),
            ],
          ),

          //List widget.
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: [
              BaseListItem(
                lstObj: controller.lstWidgetMaterial,
                onTab: controller.onNavigator,
              ),
              BaseListItem(
                lstObj: controller.lstWidgetCupertino,
                onTab: controller.onNavigator,
              ),
            ],
          ).expand(),
        ],
      ),
      drawer: const DrawerView(),
    );
  }
}
