import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';
import '/page/sign_in/sign_in_controller.dart';
import '/utils/app_validation.dart';
import '/widget/buttons/button_widget.dart';

class SignInForm extends GetView<SignInController> {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                textInputAction: TextInputAction.next,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (val) => AppValidation.empty(val, 'Username'),
                decoration: Styles.inputDecoration1(hint: 'Username'),
              ),
              const SizedBox(height: 20),
              Obx(() {
                return TextFormField(
                  controller: controller.passwordController,
                  textInputAction: TextInputAction.done,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (val) => AppValidation.empty(val, 'Password'),
                  obscureText: !controller.showPassword.value,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'hint_password'.tr,
                    hintStyle: Styles.normalText(color: Styles.black5),
                    border: Styles.inputBorder(color: Styles.grey27),
                    enabledBorder: Styles.inputBorder(color: Styles.grey27),
                    focusedBorder:
                        Styles.inputBorder(color: Colors.lightBlueAccent),
                    focusedErrorBorder:
                        Styles.inputBorder(color: Colors.redAccent),
                    errorBorder: Styles.inputBorder(color: Colors.redAccent),
                    suffixIcon: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: controller.changedShowPassword,
                      child: Icon(
                        (controller.showPassword.value)
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: Colors.black.withOpacity(0.25),
                      ),
                    ),
                  ),
                );
              }),
              const SizedBox(height: 30),
              ButtonWidget(
                radius: 5,
                elevation: 0,
                height: 44,
                width: Get.width,
                text: 'sign_in',
                onTap: () => controller.onSignIn(context),
              ),
            ],
          );
        },
      ),
    );
  }
}
