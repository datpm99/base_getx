import 'package:get/get.dart';
import '/routes/routes.dart';

class WalkThroughController extends GetxController {
  int currentPage = 0;

  void onPageChanged(int val) {
    currentPage = val;
    update();
  }

  void onSkip() {
    Get.offAllNamed(Routes.signIn);
  }
}
