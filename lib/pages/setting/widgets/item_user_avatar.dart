import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/setting/setting_controller.dart';
import '/widgets/circle_avatar_widget.dart';

class ItemUserAvatar extends GetView<SettingController> {
  const ItemUserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextButton(
        onPressed: (){},
        style: TextButton.styleFrom(
          primary: Styles.primaryColor,
          backgroundColor: Colors.grey[100],
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Row(
          children: [
            const CircleAvatarWidget(size: 40),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Phạm Minh Đạt',
                  style: Styles.mediumTextW700(color: Colors.black87),
                  overflow: TextOverflow.ellipsis,
                ),
                const Text(
                  'Mr.Mol',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
