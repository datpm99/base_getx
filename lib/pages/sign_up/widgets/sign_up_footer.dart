import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/theme/styles.dart';
import '/routes/routes.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${'do_you_already_have_an_account'.tr} ',
          style: Styles.mediumText(color: Colors.grey),
        ),
        GestureDetector(
          onTap: () => Get.offNamed(Routes.signIn),
          child: Text(
            'sign_in'.tr,
            style: Styles.mediumTextW700(color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
