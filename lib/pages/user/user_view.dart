import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'user_controller.dart';
import 'widgets/item_user.dart';
import 'widgets/item_user_avatar.dart';

class UserView extends GetView<UserController> {
  const UserView({Key? key}) : super(key: key);

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
                return ItemUser(
                  text: controller.textMode.value,
                  onTap: controller.onChangeTheme,
                  icon: (controller.modeLight.value)
                      ? Icons.light_mode
                      : Icons.dark_mode,
                );
              }),
              ItemUser(
                text: 'language',
                onTap: controller.onLanguage,
                icon: Icons.language,
              ),
              ItemUser(
                text: 'sign_in',
                onTap: controller.onSignIn,
                icon: Icons.login,
              ),
              ItemUser(
                text: 'sign_up',
                onTap: controller.onSignUp,
                icon: Icons.app_registration,
              ),
              ItemUser(
                text: 'otp',
                onTap: controller.onOtp,
                icon: Icons.vpn_key,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
