import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '/const/import_const.dart';
import '/pages/home/widgets/base_list_item.dart';
import 'chart_controller.dart';

class ChartView extends GetView<ChartController> {
  const ChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text('Chart', style: Styles.normalTextW700(size: 20)),
        actions: [
          Lottie.asset('assets/jsons/animation_chart.json'),
          const SizedBox(width: 5),
        ],
      ),
      body: BaseListItem(
        lstObj: controller.lstChart,
        onTab: controller.onNavigator,
      ),
    );
  }
}
