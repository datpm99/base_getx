import 'package:get/get.dart';

class WalkThrough3Controller extends GetxController {
  int currentPage = 0;

  void onPageChanged(int val) {
    currentPage = val;
    update();
  }
}
