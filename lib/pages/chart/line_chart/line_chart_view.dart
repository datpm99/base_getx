import 'package:flutter/material.dart';
import '/const/import_const.dart';

class LineChartView extends StatelessWidget {
  const LineChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Line Chart', style: Styles.normalTextW700(size: 20)),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
