import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/otp/widgets/otp_form.dart';
import 'otp_controller.dart';
import 'widgets/otp_count_down.dart';
import 'widgets/otp_resend.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'otp_verification'.tr,
                style: Styles.normalTextW700(size: 24),
              ).py(30),
              Text(
                'otp_sent_code'
                    .trParams({'phone': AppUtils.maskPhone(controller.phone)}),
                style: Styles.mediumText(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const OtpCountDown().py(30),
              const OtpResend(),
              const OtpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
