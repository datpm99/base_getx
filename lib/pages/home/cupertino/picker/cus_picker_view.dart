import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/widgets/buttons/default_button.dart';
import 'widget/date_picker.dart';
import 'widget/picker.dart';
import 'widget/time_picker.dart';

class CusPickerView extends StatelessWidget {
  const CusPickerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Cupertino Picker',
          style: Styles.normalTextW700(size: 20),
        ),
      ),
      body: Column(
        children: [
          DefaultButton(
            width: Get.width,
            radius: 8,
            text: 'Cupertino Date Picker',
            onTap: () => Get.bottomSheet(const DatePicker()),
            isUpper: false,
          ),
          const SizedBox(height: 15),
          DefaultButton(
            width: Get.width,
            radius: 8,
            text: 'Cupertino Time Picker',
            onTap: () => Get.bottomSheet(const TimePicker()),
            isUpper: false,
          ),
          const SizedBox(height: 15),
          DefaultButton(
            width: Get.width,
            radius: 8,
            text: 'Cupertino Picker',
            onTap: () => Get.bottomSheet(Picker()),
            isUpper: false,
          ),
        ],
      ).pSymmetric(h: 12, v: 15),
    );
  }
}
