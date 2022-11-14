import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/setting/profile/profile_controller.dart';
import '/widgets/buttons/default_button.dart';
import '/widgets/buttons/default_outline_button.dart';

class ProfileSheetImg extends GetView<ProfileController> {
  const ProfileSheetImg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          DefaultOutlineButton(
            radius: 5,
            onTap: controller.onCameraImg,
            text: 'take_a_photo',
          ).expand(),
          const SizedBox(width: 5),
          DefaultButton(
            radius: 5,
            text: 'upload',
            onTap: controller.onUploadImg,
          ).expand(),
        ],
      ),
    );
  }
}
