import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/const/theme/styles.dart';
import '/routes/routes.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${'you_do_not_have_an_account'.tr} ',
          style: Styles.mediumText(color: Colors.grey),
        ),
        InkWell(
          onTap: () => Get.offNamed(Routes.signUp),
          child: Text(
            'sign_up'.tr,
            style: Styles.mediumTextW700(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
