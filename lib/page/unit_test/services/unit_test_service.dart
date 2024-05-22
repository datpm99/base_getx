import 'package:base_get/page/unit_test/models/user_model.dart';
import 'package:base_get/service/api/base_api.dart';
import 'package:base_get/service/api/end_point.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitTestService {
  final _service = Get.find<BaseApi>();

  Future<UserModel?> getUsers(var data) async {
    try {
      var response = await _service.get(
        url: EndPoint.getUsers,
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
