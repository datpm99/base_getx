import 'package:get/get.dart';
import 'chart_controller.dart';

class ChartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChartController());
  }
}
