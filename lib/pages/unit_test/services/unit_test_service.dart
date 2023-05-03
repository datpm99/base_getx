import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/pages/unit_test/models/comment_model.dart';
import '/pages/unit_test/models/post_model.dart';
import '/services/api/base_api.dart';
import '/services/api/common_api.dart';

class UnitTestService {
  final _service = Get.find<BaseApi>();

  Future<List<CommentModel>?> getListComment() async {
    try {
      var response = await _service.getRequest(
        url: CommonApi.getComment,
      );

      if (response != null) {
        return List<CommentModel>.from(
            response.data.map((x) => CommentModel.fromJson(x)));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<PostModel?> postComment(String data) async {
    try {
      var response = await _service.postRequest(
        url: CommonApi.postComment,
        data: data,
      );

      if (response != null) {
        return PostModel.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
