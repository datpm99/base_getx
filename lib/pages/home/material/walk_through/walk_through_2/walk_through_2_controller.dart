import 'package:get/get.dart';

class WalkThrough2Controller extends GetxController {
  int currentPage = 0;
  var titles = [
    "All important tips",
    "Meditation is usefull for health",
    "Jogging is good for health",
  ];

  var subTitles = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.This is simply text",
  ];

  void onPageChanged(int val) {
    currentPage = val;
    update();
  }
}
