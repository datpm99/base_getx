import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import 'models/comment_model.dart';
import 'services/unit_test_service.dart';

class UnitTestController extends GetxController {
  final _service = UnitTestService();
  List<CommentModel> lstComment = [];
  bool postSuccess = false;
  bool isLoadData = true;

  Future<void> getListComment() async {
    final result = await _service.getListComment();
    await 1.delay();
    isLoadData = false;

    if (result != null) {
      lstComment.addAll(result);
      update();
      return;
    }

    debugPrint('error ---> getListComment');
  }

  Future<void> postComment() async {
    Map<String, dynamic> request = {
      "title": "foo1",
      "body": "bar",
      "userId": 1
    };
    AppUtils.showLoader();
    final result = await _service.postComment(jsonEncode(request));
    AppUtils.hideLoader();

    if (result != null) {
      AppUtils.showSuccess('post comment success');
      postSuccess = true;
      return;
    }

    debugPrint('error ---> postComment');
  }

  //Counter.
  int count = 0;

  void increment() => count++;

  void decrement() => count--;

  @override
  void onReady() {
    super.onReady();
    getListComment();
  }
}
