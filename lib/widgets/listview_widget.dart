import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '/const/import_const.dart';
import 'list_empty_widget.dart';
import 'skeleton_widget.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    Key? key,
    this.isLoading = false,
    this.skeletonWidget = const SkeletonWidget(),
    required this.itemCount,
    required this.scrollController,
    required this.child,
    this.padding = const EdgeInsets.all(10),
    required this.onRefresh,
    this.indicatorColor = Styles.white11,
    this.indicatorBgColor = Colors.white,
    this.showIndicatorLoadMore = false,
  }) : super(key: key);

  final bool isLoading, showIndicatorLoadMore;
  final Widget skeletonWidget;
  final int itemCount;
  final ScrollController scrollController;
  final IndexedWidgetBuilder child;
  final EdgeInsetsGeometry padding;
  final Future<void> Function() onRefresh;
  final Color indicatorColor;
  final Color indicatorBgColor;

  @override
  Widget build(BuildContext context) {
    if (!isLoading && itemCount == 0) return const ListEmptyWidget();

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: isLoading
          ? skeletonWidget
          : LiquidPullToRefresh(
              springAnimationDurationInMilliseconds: 400,
              color: indicatorColor,
              backgroundColor: indicatorBgColor,
              showChildOpacityTransition: false,
              onRefresh: onRefresh,
              child: ListView.builder(
                itemCount: itemCount + 1,
                controller: scrollController,
                padding: padding,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (ctx, index) {
                  if (index == itemCount && showIndicatorLoadMore) {
                    return const CupertinoActivityIndicator();
                  }

                  if (index == itemCount) return const SizedBox();

                  return child(ctx, index);
                },
              ),
            ),
    );
  }
}
