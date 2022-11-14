import 'package:get/get.dart';
import 'utility_controller.dart';

class UtilityBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UtilityController());
  }
}
