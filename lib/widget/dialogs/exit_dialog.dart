import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';
import '/widget/buttons/button_widget.dart';

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: Styles.borderDialog(radius: 16),
      insetPadding: const EdgeInsets.all(28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20),
          Text(
            'confirm_exit'.tr,
            style: Styles.bigTextW700(color: Styles.black2),
          ),
          const SizedBox(height: 15),
          Text(
            'msg_close_app'.tr,
            style: Styles.mediumText(color: Styles.black2),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonWidget(
                text: 'no',
                color: Colors.black.withOpacity(0.06),
                styles: Styles.mediumTextW700(),
                onTap: () => Get.back(result: false),
              ).expand(),
              const SizedBox(width: 8),
              ButtonWidget(
                text: 'yes',
                color: Styles.primaryColor,
                onTap: () => Get.back(result: true),
              ).expand(),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ).pSymmetric(h: 20),
    );
  }
}
