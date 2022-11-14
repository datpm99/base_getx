import 'package:get/get.dart';
import 'walk_through_controller.dart';

class WalkThroughBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WalkThroughController());
  }
}
