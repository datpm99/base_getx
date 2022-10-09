import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/sign_in/sign_in_controller.dart';
import '/widgets/buttons/default_button.dart';
import '/widgets/get_input_text.dart';

class SignInForm extends GetView<SignInController> {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetInputText(config: controller.phone),
        const SizedBox(height: 10),
        GetInputText(config: controller.password),
        Row(
          children: [
            const Spacer(),
            GestureDetector(
              //onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
              child: Text(
                "forgot_password".tr,
                style: TextStyle(
                  color: Colors.grey[600],
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        DefaultButton(
          radius: 5,
          onTap: controller.onSignIn,
          text: 'sign_in',
        ),
      ],
    );
  }
}
