import 'package:get/get.dart';
import '/pages/user/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
