import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';

class SheetTimePicker extends StatelessWidget {
  const SheetTimePicker({
    super.key,
    required this.initialDateTime,
    required this.onDateTimeChanged,
  });
  final DateTime initialDateTime;
  final Function(DateTime) onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: Get.back,
                child: Container(
                  height: 30,
                  width: 60,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Text(
                    'Cancel',
                    style:
                        Styles.normalText(size: 15, color: Styles.primaryColor),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.back(result: true),
                child: Container(
                  height: 30,
                  width: 60,
                  alignment: Alignment.center,
                  child: Text(
                    'OK',
                    style:
                        Styles.normalText(size: 15, color: Styles.primaryColor),
                  ),
                ),
              ),
            ],
          ).pSymmetric(h: 8, v: 6),
          const Divider(height: 1, thickness: 1, color: Styles.white3),
          SizedBox(
            height: 300,
            child: CupertinoDatePicker(
              initialDateTime: initialDateTime,
              mode: CupertinoDatePickerMode.time,
              minimumDate: DateTime(2024, 1, 24),
              use24hFormat: true,
              onDateTimeChanged: onDateTimeChanged,
            ),
          ),
        ],
      ),
    );
  }
}
