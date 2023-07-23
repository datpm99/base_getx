import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    super.dispose();
  }
}
