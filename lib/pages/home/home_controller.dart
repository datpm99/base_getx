import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/models/obj_model.dart';
import '/routes/routes.dart';
import 'cupertino/action_sheet.dart';
import 'cupertino/cus_alert_dialog.dart';

class HomeController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final pageController = PageController();
  int currentTab = 0;

  //List Screen.
  List<ObjModel> lstWidgetMaterial = [
    ObjModel(
      title: 'WalkThrough',
      subTitle: 'WalkThrough Screens',
      color: Styles.red6,
      route: Routes.walkThrough,
    ),
    ObjModel(
      title: 'Checkbox',
      subTitle: 'Checkbox Screens',
      color: Styles.primaryColor,
      route: Routes.checkBox,
    ),
    ObjModel(
      title: 'Chip',
      subTitle: 'Chip Screens',
      color: Styles.yellow4,
      route: Routes.chip,
    ),
    ObjModel(
      title: 'Color Filtered',
      subTitle: 'Color Filtered Screens',
      color: Styles.green3,
      route: Routes.colorFiltered,
    ),
  ];

  //List widget cupertino.
  List<ObjModel> lstWidgetCupertino = [
    ObjModel(
      title: 'Action Sheet',
      subTitle: '',
      color: Styles.red6,
      route: 'CupertinoActionSheet',
    ),
    ObjModel(
      title: 'Alert Dialog',
      subTitle: '',
      color: Styles.purple4,
      route: 'CupertinoAlertDialog',
    ),
    ObjModel(
      title: 'Context Menu',
      subTitle: '',
      color: Styles.pink2,
      route: 'contextMenu',
    ),
    ObjModel(
      title: 'Sliding Segmented Control',
      subTitle: '',
      color: Styles.yellow4,
      route: 'slidingSegmented',
    ),
  ];

  void onNavigator(String route) {
    switch (route) {
      case 'CupertinoActionSheet':
        Get.bottomSheet(const ActionSheet());
        break;
      case 'CupertinoAlertDialog':
        Get.dialog(const CusAlertDialog());
        break;
      default:
        Get.toNamed(route);
        break;
    }
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }

  void onChangedTap(int type) {
    currentTab = type;
    pageController.jumpToPage(type);
    update();
  }

  void onPageChanged(int page) {
    currentTab = page;
    update();
  }
}
