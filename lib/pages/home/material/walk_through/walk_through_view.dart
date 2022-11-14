import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/home/widgets/base_list_item.dart';
import 'walk_through_controller.dart';

class WalkThroughView extends GetView<WalkThroughController> {
  const WalkThroughView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'WalkThrough Screens',
          style: Styles.normalTextW700(size: 20),
        ),
      ),
      body: BaseListItem(
        lstObj: controller.lstWalkThrough,
        onTab: controller.showWalkThrough,
      ),
    );
  }
}
