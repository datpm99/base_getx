import 'package:get/get.dart';
import 'report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ReportController());
  }
}
