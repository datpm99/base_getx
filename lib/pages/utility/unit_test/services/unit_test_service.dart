import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/utility/unit_test/models/user_model.dart';
import '/services/api/base_api.dart';
import '/services/api/common_api.dart';

class UnitTestService {
  final _service = Get.find<BaseApi>();

  Future<UserModel?> getUsers(var data) async {
    try {
      var response = await _service.getRequest(
        url: CommonApi.getUsers,
        data: data,
      );

      if (response != null) {
        return UserModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
