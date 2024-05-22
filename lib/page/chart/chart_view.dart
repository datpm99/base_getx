import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/theme/styles.dart';
import 'chart_controller.dart';

class ChartView extends GetView<ChartController> {
  const ChartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text('Chart', style: Styles.normalTextW700(size: 20)),
      ),
      body: Center(
        child: Text(
          'Coming soon',
          style: Styles.mediumText(),
        ),
      ),
    );
  }
}
