import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/profile/profile_controller.dart';

class FieldDob extends GetView<ProfileController> {
  const FieldDob({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.selectDate(context),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Styles.grey13),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              return Text(
                controller.strDob.value,
                style: Styles.normalText(
                    color: (controller.isSelectDate.value)
                        ? Styles.black2
                        : Styles.grey3),
              );
            }),
            const Icon(Icons.date_range, color: Styles.grey13)
          ],
        ),
      ),
    );
  }
}
