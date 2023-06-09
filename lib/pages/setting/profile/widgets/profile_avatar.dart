import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/setting/profile/profile_controller.dart';
import 'profile_sheet_img.dart';

class ProfileAvatar extends GetView<ProfileController> {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: 120,
        height: 120,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            (controller.isPicker.value)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.file(
                      controller.file,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  )
                : CircleAvatar(
                    backgroundColor: Styles.primaryColor,
                    child: Text(
                      'DAT',
                      style: Styles.bigTextW600(color: Colors.white),
                    ),
                  ),
            Positioned(
              right: -10,
              bottom: 0,
              child: SizedBox(
                height: 40,
                width: 40,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    primary: Colors.white,
                    backgroundColor: Colors.grey[400],
                  ),
                  onPressed: () => Get.bottomSheet(const ProfileSheetImg()),
                  child: const Icon(Icons.camera_alt),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
