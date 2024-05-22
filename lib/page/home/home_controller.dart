import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';
import '/model/obj_model.dart';
import '/routes/routes.dart';

class HomeController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  //List Screen.
  List<ObjModel> lstUtil = [
    ObjModel(
      title: 'Before After Image',
      subTitle: 'Before After Image Screens',
      color: Styles.red6,
      route: Routes.beforeAfterImg,
    ),
    ObjModel(
      title: 'Unit Test',
      subTitle: 'Unit Test Screens',
      color: Styles.primaryColor,
      route: Routes.unitTest,
    ),
    ObjModel(
      title: 'Form',
      subTitle: 'Form widgets',
      color: Styles.green3,
      route: Routes.form,
    ),
  ];

  void onNavigator(String route) {
    Get.toNamed(route);
  }

  void closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
