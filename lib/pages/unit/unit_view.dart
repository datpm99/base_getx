import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'unit_controller.dart';

class UnitView extends GetView<UnitController> {
  const UnitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'UNIT',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
