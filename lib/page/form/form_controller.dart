import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  final nameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final cardNumberCtrl = TextEditingController();
  final dateCtrl = TextEditingController();
  final moneyCtrl = TextEditingController();
  final trongTaiCtrl = TextEditingController();
  final numberRangeCtrl = TextEditingController();
  final dauCauCtrl = TextEditingController();

  void submitForm(BuildContext ctx) {
    Form.of(ctx).validate();
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
    super.dispose();
  }
}
