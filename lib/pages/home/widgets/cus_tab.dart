import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/home/home_controller.dart';

class CusTab extends StatelessWidget {
  const CusTab({
    Key? key,
    required this.text,
    required this.tab,
    this.borderLeft = false,
  }) : super(key: key);
  final String text;
  final bool borderLeft;
  final int tab;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (c) {
      return GestureDetector(
        onTap: () => c.onChangedTap(tab),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: (tab == c.currentTab) ? Styles.grey16 : Colors.white,
            borderRadius: BorderRadius.only(
              topRight: (borderLeft) ? Radius.zero : const Radius.circular(20),
              topLeft: (!borderLeft) ? Radius.zero : const Radius.circular(20),
            ),
          ),
          child: Text(
            text,
            style: Styles.mediumTextW700(
              color:
                  (tab == c.currentTab) ? Styles.primaryColor : Styles.black2,
            ),
          ),
        ),
      );
    });
  }
}
