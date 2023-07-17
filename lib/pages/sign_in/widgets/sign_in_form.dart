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
        const SizedBox(height: 20),
        GetInputText(config: controller.password),
        const SizedBox(height: 30),
        DefaultButton(
          radius: 5,
          elevation: 0,
          height: 44,
          width: Get.width,
          text: 'sign_in',
          onTap: controller.onSignIn,
        ),
      ],
    );
  }
}
