import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/const/import_const.dart';

class ListEmptyWidget extends StatelessWidget {
  const ListEmptyWidget({
    Key? key,
    this.showDivider = true,
    this.text = 'list_empty',
  }) : super(key: key);

  final bool showDivider;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: showDivider,
          child: const Divider(color: Styles.white8, height: 1),
        ),
        Text(text.tr, style: Styles.bigTextW700()).pSymmetric(v: 35.h),
        Image.asset('assets/images/no_data.png').expand(),
      ],
    );
  }
}
