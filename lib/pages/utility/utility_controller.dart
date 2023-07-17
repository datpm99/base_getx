import 'package:get/get.dart';
import '/const/import_const.dart';
import '/models/obj_model.dart';
import '/routes/routes.dart';

class UtilityController extends GetxController {
  //List Utility.
  List<ObjModel> lstUtil = [
    ObjModel(
      title: 'Before After Image',
      subTitle: 'Before After Image Screens',
      color: Styles.red6,
      route: Routes.beforeAfterImg,
    ),
    ObjModel(
      title: 'TinderCard',
      subTitle: 'TinderCard Screens',
      color: Styles.purple4,
      route: Routes.tinderCard,
    ),
    ObjModel(
      title: 'Show Case View',
      subTitle: 'Show Case View Screens',
      color: Styles.pink2,
      route: Routes.showCase,
    ),
    ObjModel(
      title: 'Unit Test',
      subTitle: 'Unit Test Screens',
      color: Styles.primaryColor,
      route: Routes.unitTest,
    ),
    ObjModel(
      title: 'Paint',
      subTitle: 'Paint widgets',
      color: Styles.yellow4,
      route: Routes.paint,
    ),
  ];

  void onNavigator(String route) {
    Get.toNamed(route);
  }
}
