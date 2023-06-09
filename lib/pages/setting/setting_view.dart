import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/utils/app_utils.dart';
import 'setting_controller.dart';
import 'widgets/item_setting.dart';
import 'widgets/item_user_avatar.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const ItemUserAvatar(),
              Obx(() {
                return ItemSetting(
                  text: controller.textMode.value,
                  onTap: controller.onChangeTheme,
                  icon: (controller.modeLight.value)
                      ? Icons.light_mode
                      : Icons.dark_mode,
                );
              }),
              ItemSetting(
                text: 'language',
                onTap: controller.onLanguage,
                icon: Icons.language,
              ),
              ItemSetting(
                text: 'otp',
                onTap: controller.onOtp,
                icon: Icons.vpn_key,
              ),
              const ItemSetting(
                text: 'logout',
                onTap: AppUtils.logout,
                icon: Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
