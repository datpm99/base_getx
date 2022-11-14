import 'package:get/get.dart';

class PieChartController extends GetxController {
  int touchedIndex1 = -1;

  void onTouchChart1(var event, var pieTouchResponse) {
    if (!event.isInterestedForInteractions ||
        pieTouchResponse == null ||
        pieTouchResponse.touchedSection == null) {
      touchedIndex1 = -1;
      update();
      return;
    }
    touchedIndex1 = pieTouchResponse.touchedSection!.touchedSectionIndex;
    update();
  }
}
