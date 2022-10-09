import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/sign_up/sign_up_controller.dart';
import '/widgets/buttons/default_button.dart';
import '/widgets/get_input_text.dart';

class SignUpForm extends GetView<SignUpController> {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetInputText(config: controller.fullName),
        GetInputText(config: controller.phone).py(10),
        GetInputText(config: controller.password),
        const SizedBox(height: 20),
        DefaultButton(
          radius: 5,
          onTap: controller.onSignUp,
          text: 'sign_up',
        ),
      ],
    );
  }
}
