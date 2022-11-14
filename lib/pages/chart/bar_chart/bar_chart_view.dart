import '/const/import_const.dart';
import 'package:flutter/material.dart';

class BarChartView extends StatelessWidget {
  const BarChartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Bar Chart', style: Styles.normalTextW700(size: 20)),
      ),
    );
  }
}
