import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/const/import_const.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Text('Cancel', style: Styles.bigTextW700()),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Text('Done', style: Styles.bigTextW700()),
              ),
            ],
          ).p(8),
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              backgroundColor: Colors.white,
              minimumDate: DateTime.now(),
              minuteInterval: 1,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (val) {},
            ),
          ),
        ],
      ),
    );
  }
}
