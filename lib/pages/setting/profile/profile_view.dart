import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/theme/styles.dart';
import '/widgets/buttons/default_button.dart';
import 'profile_controller.dart';
import 'widgets/profile_avatar.dart';
import 'widgets/profile_form.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Styles.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'personal_info'.tr,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const ProfileAvatar(),
              const ProfileForm(),
              DefaultButton(
                width: Get.width,
                radius: 5,
                onTap: controller.updateProfile,
                text: 'update',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
