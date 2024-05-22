import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/mixin/load_more_mixin.dart';
import 'models/user_model.dart';
import 'services/unit_test_service.dart';

class UnitTestController extends GetxController with LoadMoreMixin {
  final _service = UnitTestService();
  List<User> lstUser = [];

  @override
  Future<void> getData() async {
    var data = {
      "page": page,
      "per_page": 10,
    };
    final result = await _service.getUsers(data);
    await 1.delay();
    isLoading = false;

    if (result != null) {
      if (page == result.totalPages) isLoadMore = false;
      lstUser.addAll(result.data);
      update();
      return;
    }

    debugPrint('error ---> getListUser');
    update();
  }

  @override
  void updateData() {
    update();
  }

  Future<void> onRefreshData() async {
    lstUser.clear();
    refreshData();
  }

  //Counter.
  int count = 0;

  void increment() => count++;

  void decrement() => count--;

  @override
  void onReady() {
    super.onReady();
    loadMoreData();
    getData();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
