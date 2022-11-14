import 'package:get/get.dart';

class ChipController extends GetxController {
  RxInt choiceChip = 0.obs;
  RxInt filterChip = 0.obs;

  void onChangedChoiceChip(int index) {
    choiceChip.value = index;
  }

  void onChangedFilterChip(int index) {
    filterChip.value = index;
  }
}
