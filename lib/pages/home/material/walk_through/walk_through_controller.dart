import 'package:get/get.dart';

import '/const/import_const.dart';
import '/models/obj_model.dart';
import '/routes/routes.dart';

class WalkThroughController extends GetxController {
  List<ObjModel> lstWalkThrough = [
    ObjModel(
      title: 'WalkThrough 1',
      subTitle: 'This is walkThrough 1',
      color: Styles.purple4,
      route: Routes.walkThrough1,
    ),
    ObjModel(
      title: 'WalkThrough 2',
      subTitle: 'This is walkThrough 2',
      color: Styles.pink2,
      route: Routes.walkThrough2,
    ),
    ObjModel(
      title: 'WalkThrough 3',
      subTitle: 'This is walkThrough 3',
      color: Styles.green3,
      route: Routes.walkThrough3,
    ),
  ];

  void showWalkThrough(String route) {
    Get.toNamed(route);
  }
}
