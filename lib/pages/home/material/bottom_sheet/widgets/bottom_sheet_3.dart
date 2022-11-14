import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/home/material/bottom_sheet/bottom_sheet_controller.dart';

class BottomSheet3 extends GetView<BottomSheetController> {
  const BottomSheet3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(color: Styles.grey17, width: 50, height: 3),
          const SizedBox(height: 35),
          GridView.builder(
            itemCount: controller.lstItemSheet3.length,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: Styles.boxShadow2(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: Get.width / 7.5,
                      width: Get.width / 7.5,
                      margin: const EdgeInsets.only(bottom: 4, top: 8),
                      padding: EdgeInsets.all(Get.width / 30),
                      decoration: BoxDecoration(
                        color: controller.lstItemSheet3[index].color,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset(
                        controller.lstItemSheet3[index].image,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      controller.lstItemSheet3[index].title,
                      style: Styles.mediumText(),
                    )
                  ],
                ),
              );
            },
          ).expand(),
        ],
      ),
    );
  }
}
