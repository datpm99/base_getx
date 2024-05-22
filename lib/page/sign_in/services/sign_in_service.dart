import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';
import '/page/sign_in/models/sign_in_model.dart';

class SignInService {
  final _service = Get.find<BaseApi>();

  Future<SignInModel?> login(String request) async {
    try {
      var response = await _service.post(
        url: EndPoint.login,
        data: request,
      );

      if (response != null && response.statusCode == 200) {
        return SignInModel.fromJson(response.data);
      }

      if (response != null && response.data != null) {
        String msg = response.data['message'] ?? 'msg_have_error'.tr;
        AppUtils.showError(msg);
        return null;
      }

      AppUtils.showError('msg_have_error'.tr);
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
