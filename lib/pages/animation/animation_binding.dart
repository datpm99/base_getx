import 'package:get/get.dart';
import 'animation_controller.dart';

class AnimationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Animation1Controller());
  }
}
