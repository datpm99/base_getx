import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';

class CusContextMenuView extends StatelessWidget {
  const CusContextMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Cupertino Context Menu',
          style: Styles.normalTextW700(size: 20),
        ),
      ),
      body: CupertinoContextMenu(
        child: Container(
          height: 190,
          width: Get.width,
          margin: const EdgeInsets.all(16.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/avatar1.jpeg', fit: BoxFit.cover),
          ),
        ),
        actions: <Widget>[
          CupertinoContextMenuAction(
            child: Text('Copy', style: Styles.normalText()),
            isDefaultAction: true,
            trailingIcon: Icons.content_copy,
            onPressed: () => Get.back(),
          ),
          CupertinoContextMenuAction(
            child: Text('Share', style: Styles.normalText()),
            trailingIcon: Icons.share,
            onPressed: () => Get.back(),
          ),
          CupertinoContextMenuAction(
            child: Text('Delete', style: Styles.normalText()),
            trailingIcon: Icons.delete,
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
}
