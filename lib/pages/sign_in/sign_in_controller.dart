import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/routes/routes.dart';
import '/widgets/get_input_text.dart';
import 'models/requests/sign_in_request.dart';
import 'services/sign_in_service.dart';
import 'sign_in_fields.dart';

class SignInController extends GetxController {
  final _storage = Get.find<StorageService>();
  final _service = SignInService();
  final _fields = SignInFields();

  GetInputTextConfig get phone => _fields.phone;

  GetInputTextConfig get password => _fields.password;

  void onSignIn() {
    bool isPhone = phone.validate();
    bool isPassword = password.validate();
    if (isPhone && isPassword) {
      debugPrint('login success!');
      Get.offAllNamed(Routes.root);
    }
  }

  Future<void> _login() async {
    AppUtils.showLoader();
    SignInRequest request = SignInRequest(
      phone: _fields.phone.value.trim(),
      password: _fields.password.value,
      deviceId: _storage.deviceID,
    );

    var result = await _service.login(request.toJson());
    AppUtils.hideLoader();

    if (result != null && result.errorCode == StatusCode.ok) {
      if (result.data == null) return;

      //Set token.
      DateTime sessionTimeout =
          DateTime.now().add(Duration(seconds: result.data!.tokenTimeout));
      _storage.apiToken = result.data!.token;
      _storage.sessionTimeout = sessionTimeout.toString();

      Get.offAllNamed(Routes.root);
      return;
    }

    AppUtils.showMessApi(result, '_login');
  }
}
