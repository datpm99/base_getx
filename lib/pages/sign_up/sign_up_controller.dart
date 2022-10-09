import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/routes/routes.dart';
import '/widgets/get_input_text.dart';
import 'services/sign_up_service.dart';
import 'sign_up_fields.dart';

class SignUpController extends GetxController {
  final _fields = SignUpFields();
  final _service = SignUpService();

  GetInputTextConfig get fullName => _fields.fullName;

  GetInputTextConfig get phone => _fields.phone;

  GetInputTextConfig get password => _fields.password;

  void onSignUp() {
    bool isName = fullName.validate();
    bool isPhone = phone.validate();
    bool isPassword = password.validate();
    if (isName && isPhone && isPassword) {
      debugPrint('SignUp success!');
      Get.offNamed(Routes.signIn);
    }
  }
}
