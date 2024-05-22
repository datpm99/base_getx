import 'package:get/get.dart';

import '/page/animation/animation_controller.dart';
import '/page/chart/chart_controller.dart';
import '/page/home/home_controller.dart';
import '/page/setting/setting_controller.dart';
import '/page/utility/utility_controller.dart';
import 'root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RootController());
    Get.put(Animation1Controller());
    Get.put(UtilityController());
    Get.put(HomeController());
    Get.put(ChartController());
    Get.put(SettingController());
  }
}
