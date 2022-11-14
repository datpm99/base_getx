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
      title: 'Confetti',
      subTitle: 'Confetti Screens',
      color: Styles.green3,
      route: Routes.confetti,
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
  ];

  void onNavigator(String route) {
    Get.toNamed(route);
  }
}
