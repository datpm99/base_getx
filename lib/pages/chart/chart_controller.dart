import 'package:get/get.dart';

import '/const/import_const.dart';
import '/models/obj_model.dart';
import '/routes/routes.dart';

class ChartController extends GetxController {
  //List Chart.
  List<ObjModel> lstChart = [
    ObjModel(
      title: 'Pie Chart',
      subTitle: 'Pie Chart Screens',
      color: Styles.red6,
      route: Routes.pieChart,
    ),
    ObjModel(
      title: 'Line Chart',
      subTitle: 'Line Chart Screens',
      color: Styles.green3,
      route: Routes.lineChart,
    ),
    ObjModel(
      title: 'Bar Chart',
      subTitle: 'Bar Chart Screens',
      color: Styles.purple4,
      route: Routes.barChart,
    ),
  ];

  void onNavigator(String route) {
    Get.toNamed(route);
  }
}
