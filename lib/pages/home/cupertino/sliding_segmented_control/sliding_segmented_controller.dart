import 'package:get/get.dart';

class SlidingSegmentedController extends GetxController {
  int sliding = 0;

  void onValueChanged(int? val){
    sliding = val!;
    update();
  }
}
