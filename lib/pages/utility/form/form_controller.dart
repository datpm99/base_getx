import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/models/select_model.dart';
import '/utils/date_formatter.dart';
import '/utils/time_formatter.dart';

class FormController extends GetxController {
  final nameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final cardNumberCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final moneyCtrl = TextEditingController();
  final trongTaiCtrl = TextEditingController();
  final numberRangeCtrl = TextEditingController();
  final dauCauCtrl = TextEditingController();
  final dateSelectCtrl = TextEditingController();
  final timeSelectCtrl = TextEditingController();

  // Selected field.
  final selectCarCtrl = TextEditingController();
  List<SelectModel> listCar = [
    SelectModel(title: 'Car 1', value: 'C1', isSelected: false.obs),
    SelectModel(title: 'Car 2', value: 'C2', isSelected: true.obs),
    SelectModel(title: 'Car 3', value: 'C3', isSelected: false.obs),
  ];
  late SelectModel carSelectedModel;

  void onSelectedCar(SelectModel val) {
    if (val.value == carSelectedModel.value) return;
    val.isSelected.value = true;
    carSelectedModel.isSelected.value = false;
    carSelectedModel = val;
    selectCarCtrl.text = val.title;
  }

  // Selected multiple field.
  final selectFruitCtrl = TextEditingController();
  List<SelectModel> listFruit = [
    SelectModel(title: 'Fruit 1', value: 'F1', isSelected: false.obs),
    SelectModel(title: 'Fruit 2', value: 'F2', isSelected: false.obs),
    SelectModel(title: 'Fruit 3', value: 'F3', isSelected: false.obs),
  ];
  List<SelectModel> listFruitSelected = [];

  void onSelectedFruit(SelectModel val) {
    val.isSelected.value = !val.isSelected.value;
    if (val.isSelected.value) {
      listFruitSelected.add(val);
    } else {
      listFruitSelected.remove(val);
    }

    selectFruitCtrl.text =
        listFruitSelected.map((e) => e.title).toList().join(", ");
  }

  void submitForm(BuildContext ctx) {
    Form.of(ctx)!.validate();
  }

  void onChangedDate(DateTime date) {
    dateSelectCtrl.text = DateFormatter.formatDate1(date);
  }

  void onChangedTime(DateTime date) {
    timeSelectCtrl.text = TimeFormatter.formatTime1(date);
  }

  @override
  void onInit() {
    super.onInit();
    carSelectedModel = listCar[1];
    selectCarCtrl.text = carSelectedModel.title;
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    cardNumberCtrl.dispose();
    dateCtrl.dispose();
    moneyCtrl.dispose();
    trongTaiCtrl.dispose();
    numberRangeCtrl.dispose();
    dauCauCtrl.dispose();
    passwordCtrl.dispose();
    dateSelectCtrl.dispose();
    timeSelectCtrl.dispose();
    selectCarCtrl.dispose();
    selectFruitCtrl.dispose();
    super.dispose();
  }
}
