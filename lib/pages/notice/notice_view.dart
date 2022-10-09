import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'notice_controller.dart';

class NoticeView extends GetView<NoticeController> {
  const NoticeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'NOTICE',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
