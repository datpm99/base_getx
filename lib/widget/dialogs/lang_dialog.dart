import 'package:base_get/widget/buttons/button_widget.dart';
import 'package:base_get/widget/buttons/outline_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';
import '/lang/lang_controller.dart';

class LanguagesDialog extends StatefulWidget {
  const LanguagesDialog({super.key});

  @override
  State<LanguagesDialog> createState() => _LanguagesDialogState();
}

class _LanguagesDialogState extends State<LanguagesDialog> {
  String language = 'vi';

  void onChangedLanguage(String? val) {
    language = val!;
    setState(() {});
  }

  void saveChangedLanguage() {
    final lang = Get.find<LangController>();
    if (language == 'vi') {
      lang.changeLang('vi', 'VN');
    } else {
      lang.changeLang('en', 'US');
    }
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: Styles.borderDialog(radius: 16),
      insetPadding: const EdgeInsets.all(28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Title.
          Text('language'.tr, style: Styles.bigTextW700()).p(15),
          const Divider(height: 1, thickness: 0.5, color: Styles.grey12),

          //
          const SizedBox(height: 15),
          RadioListTile<String>(
            title: Row(
              children: [
                Image.asset('assets/icons/ic_flag_vn.png',
                    width: 28, height: 28),
                const SizedBox(width: 10),
                Text('lang_vi'.tr, style: Styles.normalTextW500()),
              ],
            ),
            value: 'vi',
            groupValue: language,
            onChanged: onChangedLanguage,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          RadioListTile<String>(
            title: Row(
              children: [
                Image.asset('assets/icons/ic_flag_us.png',
                    width: 28, height: 28),
                const SizedBox(width: 10),
                Text('lang_us'.tr, style: Styles.normalTextW500()),
              ],
            ),
            value: 'en',
            groupValue: language,
            onChanged: onChangedLanguage,
            controlAffinity: ListTileControlAffinity.trailing,

          ),

          //
          const SizedBox(height: 15),
          const Divider(height: 1, thickness: 0.5, color: Styles.grey12),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlineButtonWidget(
                text: 'cancel',
                elevation: 0,
                styles: Styles.mediumTextW700(),
                colorText: Styles.grey15,
                onTap: Get.back,
              ).expand(),
              const SizedBox(width: 20),
              ButtonWidget(
                text: 'save',
                elevation: 0,
                onTap: saveChangedLanguage,
              ).expand(),
            ],
          ).pSymmetric(h: 12),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
