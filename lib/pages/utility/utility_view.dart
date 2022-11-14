import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '/const/import_const.dart';
import '/pages/home/widgets/base_list_item.dart';
import 'utility_controller.dart';

class UtilityView extends GetView<UtilityController> {
  const UtilityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Utility', style: Styles.normalTextW700(size: 20)),
        actions: [
          Lottie.asset('assets/jsons/animation_util.json'),
          const SizedBox(width: 5),
        ],
      ),
      body: BaseListItem(
        lstObj: controller.lstUtil,
        onTab: controller.onNavigator,
      ),
    );
  }
}
