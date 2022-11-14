import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/models/obj_model.dart';
import '/routes/routes.dart';
import 'cupertino/action_sheet.dart';
import 'cupertino/activity_indicator.dart';
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
      title: 'Detail',
      subTitle: 'Detail Screens',
      color: Styles.green3,
      route: Routes.detail,
    ),
    ObjModel(
      title: 'Bottom Sheet',
      subTitle: 'Bottom Sheet Screens',
      color: Styles.purple4,
      route: Routes.bottomSheet,
    ),
    ObjModel(
      title: 'Drawer',
      subTitle: 'Drawer Screens',
      color: Styles.pink2,
      route: 'Drawer',
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
      title: 'Stepper',
      subTitle: 'Stepper Screens',
      color: Styles.red6,
      route: Routes.stepper,
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
      title: 'Cupertino Action Sheet',
      subTitle: '',
      color: Styles.red6,
      route: 'CupertinoActionSheet',
    ),
    ObjModel(
      title: 'Cupertino Activity Indicator',
      subTitle: '',
      color: Styles.green3,
      route: 'CupertinoActivityIndicator',
    ),
    ObjModel(
      title: 'Cupertino Alert Dialog',
      subTitle: '',
      color: Styles.purple4,
      route: 'CupertinoAlertDialog',
    ),
    ObjModel(
      title: 'Cupertino Context Menu',
      subTitle: '',
      color: Styles.pink2,
      route: 'contextMenu',
    ),
    ObjModel(
      title: 'Cupertino Picker',
      subTitle: '',
      color: Styles.primaryColor,
      route: 'picker',
    ),
    ObjModel(
      title: 'Cupertino Sliding Segmented Control',
      subTitle: '',
      color: Styles.yellow4,
      route: 'slidingSegmented',
    ),
  ];

  void onNavigator(String route) {
    switch (route) {
      case 'Drawer':
        scaffoldKey.currentState!.openDrawer();
        break;
      case 'CupertinoActionSheet':
        Get.bottomSheet(const ActionSheet());
        break;
      case 'CupertinoActivityIndicator':
        Get.dialog(const ActivityIndicator());
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
