import 'package:get/get.dart';

import '/routes/routes.dart';
import '/services/storage/storage_service.dart';

class WalkThroughController extends GetxController {
  final _storage = Get.find<StorageService>();
  int currentPage = 0;

  void onPageChanged(int val) {
    currentPage = val;
    update();
  }

  void onSkip() {
    if (Get.routing.previous == Routes.signIn) {
      _storage.firstLogin = true;
      Get.offAllNamed(Routes.root);
    } else {
      Get.back();
    }
  }
}
