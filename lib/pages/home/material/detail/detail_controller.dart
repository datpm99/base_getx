import 'package:get/get.dart';

import '/const/import_const.dart';
import '/models/obj_model.dart';
import '/routes/routes.dart';

class DetailController extends GetxController {
  List<ObjModel> lstDetail = [
    ObjModel(
      title: 'Detail 1',
      subTitle: 'This is detail 1',
      color: Styles.purple4,
      route: Routes.detail1,
    ),
    ObjModel(
      title: 'Detail 2',
      subTitle: 'This is detail 2',
      color: Styles.pink2,
      route: Routes.detail2,
    ),
    ObjModel(
      title: 'Detail 3',
      subTitle: 'This is detail 3',
      color: Styles.green3,
      route: Routes.detail3,
    ),
  ];

  void showDetail(String route) {
    Get.toNamed(route);
  }
}
