import 'package:flutter/material.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import '/const/import_const.dart';

class CusTooltip extends StatelessWidget {
  const CusTooltip({
    Key? key,
    required this.content,
    required this.widget,
    this.tailWidth = 10.0,
    this.model = TooltipTriggerMode.tap,
  }) : super(key: key);
  final String content;
  final Widget widget;
  final double tailWidth;
  final TooltipTriggerMode model;

  @override
  Widget build(BuildContext context) {
    return JustTheTooltip(
      triggerMode: model,
      showDuration: const Duration(seconds: 5),
      backgroundColor: Styles.black1,
      preferredDirection: AxisDirection.up,
      tailBaseWidth: tailWidth,
      child: widget,
      content: Text(
        content,
        style: Styles.normalText(color: Colors.white),
      ).p(8),
    );
  }
}
