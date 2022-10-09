import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'REPORT',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
