import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/const/import_const.dart';
import '/pages/otp/otp_controller.dart';

class OtpCountDown extends StatelessWidget {
  const OtpCountDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
      builder: (controller) {
        if (controller.stateCountDown) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('otp_expires_in'.tr, style: Styles.bigText()),
              Text(
                ' ${controller.countDown}s',
                style: Styles.bigText(color: Colors.red),
              ),
            ],
          );
        }
        if (controller.msgErrOtp.isNotEmpty) {
          return Text(
            controller.msgErrOtp,
            style: Styles.bigText(color: Colors.red),
            textAlign: TextAlign.center,
          );
        }
        return Text(
          'otp_expired'.tr,
          style: Styles.bigText(color: Colors.red),
        );
      },
    );
  }
}
