import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/widgets/buttons/default_button.dart';
import '/widgets/buttons/default_outline_button.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      shape: Styles.borderDialog(radius: 12),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 35),
              Text(
                'confirm_exit'.tr,
                style: Styles.bigTextW700(),
              ),
              const SizedBox(height: 15),
              Text(
                'msg_close_app'.tr,
                style: Styles.normalText(),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  DefaultOutlineButton(
                    text: 'no',
                    elevation: 0,
                    radius: 6,
                    height: 40,
                    onTap: () => Get.back(result: false),
                  ).expand(),
                  const SizedBox(width: 16),
                  DefaultButton(
                    text: 'yes',
                    elevation: 0,
                    radius: 6,
                    height: 40,
                    onTap: () => Get.back(result: true),
                  ).expand(),
                ],
              ).pSymmetric(h: 16),
              const SizedBox(height: 20),
            ],
          ),
          Positioned(
            top: -122,
            child: Container(
              width: Get.width - 60,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/crocodile.png',
                width: Get.width * 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
