import 'package:flutter/material.dart';

mixin LoadMoreMixin {
  int page = 1;
  bool isLoading = true;
  bool isLoadMore = true;
  bool isLoadData = true;
  final scrollController = ScrollController();

  /// Func [getData] get list data.
  Future<void> getData();

  /// Func [updateData] update ui list.
  void updateData();

  void loadMoreData() {
    scrollController.addListener(() async {
      bool canLoadMore = (scrollController.position.extentAfter == 0);
      if (canLoadMore && isLoadMore && isLoadData) {
        page++;
        isLoadData = false;
        updateData();
        await getData();
        isLoadData = true;
      }
    });
  }

  void refreshData() {
    page = 1;
    isLoading = true;
    isLoadMore = true;
    isLoadData = true;
    updateData();
    getData();
  }
}
