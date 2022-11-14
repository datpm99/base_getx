import 'package:get/get.dart';

class WalkThrough1Controller extends GetxController {
  int currentPage = 0;

  void onPageChanged(int page) {
    currentPage = page;
    update();
  }
}
