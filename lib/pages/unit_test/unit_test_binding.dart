import 'package:get/get.dart';
import 'unit_test_controller.dart';

class UnitTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UnitTestController());
  }
}
