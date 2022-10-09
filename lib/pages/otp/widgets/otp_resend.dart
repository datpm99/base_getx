import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../otp_controller.dart';

class OtpResend extends StatelessWidget {
  const OtpResend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(builder: (controller) {
      if (controller.msgErrOtp.isEmpty) {
        return InkWell(
          onTap: (controller.stateActiveResend) ? controller.onResentOtp : null,
          child: Text(
            'otp_resend'.tr,
            style: TextStyle(
              color: (controller.stateActiveResend) ? Colors.blue : Colors.grey,
              decoration: TextDecoration.underline,
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
