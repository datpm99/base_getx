import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/const/import_const.dart';

class ActionSheet extends StatelessWidget {
  const ActionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: Text('Favorite Dessert', style: Styles.bigTextW700()),
      message:
          const Text('Please select the best dessert from the options below.'),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text(
            'Profiteroles',
            style: Styles.mediumTextW500(color: Colors.blue),
          ),
          onPressed: () => Get.back(),
        ),
        CupertinoActionSheetAction(
          child: Text(
            'Cannolis',
            style: Styles.mediumTextW500(color: Colors.blue),
          ),
          onPressed: () => Get.back(),
        ),
        CupertinoActionSheetAction(
          child: Text(
            'Trifie',
            style: Styles.mediumTextW500(color: Colors.blue),
          ),
          onPressed: () => Get.back(),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        isDefaultAction: true,
        child: const Text('Cancel'),
        onPressed: () => Get.back(),
      ),
    );
  }
}
