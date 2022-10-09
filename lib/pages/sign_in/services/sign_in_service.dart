import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/sign_in/models/sign_in_model.dart';
import '/services/api/base_api.dart';
import '/services/api/common_api.dart';

class SignInService {
  final _service = Get.find<BaseApi>();
  final _store = Get.find<StorageService>();

  Future<SignInModel?> login(String request) async {
    try {
      var response = await _service.postRequest(
        url: CommonApi.login,
        data: request,
      );

      if (response != null) {
        return SignInModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
