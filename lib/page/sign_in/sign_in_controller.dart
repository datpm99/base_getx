import 'package:base_get/const/common_export.dart';
import 'package:base_get/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool showPassword = false.obs;

  void changedShowPassword() {
    showPassword.value = !showPassword.value;
  }

  void onSignIn(BuildContext context) async {
    try {
      bool isValid = Form.of(context).validate();
      if (!isValid) return;

      // var data = {
      //   'username': nameController.text.trim(),
      //   'password': passwordController.text,
      // };
      //
      // AppUtils.showLoader();
      // final result = await loginService.login(json.encode(data));
      // AppUtils.hideLoader();
      //
      // if (result != null) {
      //   Get.offNamed(Routes.root);
      // }
      Get.offNamed(Routes.root);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onReady() {
    super.onReady();
    nameController.text = 'datpm';
    passwordController.text = '12345678';
  }

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
