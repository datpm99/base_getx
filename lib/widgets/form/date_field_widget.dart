import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/utils/app_validation.dart';
import '/widgets/buttons/default_button.dart';
import 'text_form_field_widget.dart';

class DateFieldWidget extends StatelessWidget {
  const DateFieldWidget({
    Key? key,
    required this.ctrl,
    required this.hintText,
    this.suffixIcon,
    required this.titleBottomSheet,
    this.initDateTime,
    this.maximumDate,
    this.minimumDate,
    required this.onChangedDate,
    required this.mode,
    required this.title,
  }) : super(key: key);
  final TextEditingController ctrl;
  final String title, hintText, titleBottomSheet;
  final Widget? suffixIcon;
  final DateTime? initDateTime, maximumDate, minimumDate;
  final Function(DateTime) onChangedDate;
  final CupertinoDatePickerMode mode;

  @override
  Widget build(BuildContext context) {
    DateTime initDateSelect = DateTime.now();

    return TextFormFieldWidget(
      ctrl: ctrl,
      hintText: hintText,
      validator: (val) => AppValidation.empty(val, title),
      readOnly: true,
      suffixIcon: suffixIcon,
      onTap: () => Get.bottomSheet(BottomSheetSelectDate(
        title: titleBottomSheet,
        onChangedDate: (DateTime date){
          onChangedDate(date);
          initDateSelect = date;
        },
        initDateTime: initDateSelect,
        mode: mode,
        onDone: () {
          if (ctrl.text.isEmpty) onChangedDate(DateTime.now());
          Get.back();
        },
      )),
    );
  }
}

class BottomSheetSelectDate extends StatelessWidget {
  const BottomSheetSelectDate({
    Key? key,
    required this.title,
    this.initDateTime,
    this.maximumDate,
    this.minimumDate,
    required this.onDone,
    required this.onChangedDate,
    required this.mode,
  }) : super(key: key);
  final String title;
  final DateTime? initDateTime, maximumDate, minimumDate;
  final Function(DateTime) onChangedDate;
  final VoidCallback onDone;
  final CupertinoDatePickerMode mode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration3(radius: 12),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 44),
                Text(title, style: Styles.normalTextW700()),
                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.close, color: Colors.black).p(10),
                ),
              ],
            ),
            const Divider(height: 1),
            SizedBox(
              height: 260,
              child: CupertinoDatePicker(
                mode: mode,
                onDateTimeChanged: onChangedDate,
                use24hFormat: true,
                maximumDate: maximumDate,
                minimumDate: minimumDate,
                initialDateTime: initDateTime ?? DateTime.now(),
              ),
            ),
            DefaultButton(
              width: Get.width,
              text: 'Xong',
              isUpper: false,
              radius: 8,
              height: 40,
              onTap: onDone,
            ).pSymmetric(h: 15),
          ],
        ),
      ),
    );
  }
}
