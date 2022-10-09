import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/otp/otp_controller.dart';
import '/pages/otp/widgets/otp_form_item.dart';
import '/widgets/buttons/default_button.dart';

class OtpForm extends GetView<OtpController> {
  const OtpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpFormItem(
              autoFocus: true,
              focusNode: controller.pin1FocusNode,
              controller: controller.pin1Controller,
              onChange: (p1) =>
                  controller.nextField(p1, controller.pin2FocusNode),
            ),
            OtpFormItem(
              focusNode: controller.pin2FocusNode,
              controller: controller.pin2Controller,
              onChange: (p2) =>
                  controller.nextField(p2, controller.pin3FocusNode),
            ).px(12),
            OtpFormItem(
              focusNode: controller.pin3FocusNode,
              controller: controller.pin3Controller,
              onChange: (p3) =>
                  controller.nextField(p3, controller.pin4FocusNode),
            ),
            OtpFormItem(
              focusNode: controller.pin4FocusNode,
              controller: controller.pin4Controller,
              onChange: (p4) =>
                  controller.nextField(p4, controller.pin5FocusNode),
            ).px(12),
            OtpFormItem(
              focusNode: controller.pin5FocusNode,
              controller: controller.pin5Controller,
              onChange: (p5) =>
                  controller.nextField(p5, controller.pin6FocusNode),
            ),
            OtpFormItem(
              focusNode: controller.pin6FocusNode,
              controller: controller.pin6Controller,
              onChange: (p6) {
                if (p6.length == 1) controller.pin6FocusNode.unfocus();
              },
            ).px(12),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.msgErrForm,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
        SizedBox(height: Get.height * 0.1),
        SizedBox(
          height: 50,
          width: Get.width,
          child: DefaultButton(
            onTap: controller.verifyOtp,
            text: 'confirm'.tr.toUpperCase(),
          ),
        ),
      ],
    );
  }
}
