import 'package:get/get.dart';

class SelectModel {
  SelectModel({
    required this.title,
    required this.value,
    this.data,
    required this.isSelected,
  });

  String title;
  String value;
  dynamic data;
  RxBool isSelected;
}
