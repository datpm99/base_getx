import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/user_model.dart';
import 'services/unit_test_service.dart';

class UnitTestController extends GetxController {
  final _service = UnitTestService();
  final scrollController = ScrollController();

  List<User> lstUser = [];
  int page = 1;
  bool isLoading = true;
  bool isLoadMore = true;
  bool isLoadData = true;

  Future<void> getListUser() async {
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

  void loadMoreUser() {
    scrollController.addListener(() async {
      bool canLoadMore = (scrollController.position.extentAfter == 0);
      if (canLoadMore && isLoadMore && isLoadData) {
        page++;
        isLoadData = false;
        update();
        await getListUser();
        isLoadData = true;
      }
    });
  }

  Future<void> onRefresh() async {
    lstUser.clear();
    page = 1;
    isLoading = true;
    isLoadMore = true;
    isLoadData = true;
    update();
    getListUser();
  }

  //Counter.
  int count = 0;

  void increment() => count++;

  void decrement() => count--;

  @override
  void onReady() {
    super.onReady();
    loadMoreUser();
    getListUser();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
