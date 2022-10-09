import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class DividerForm extends StatelessWidget {
  const DividerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Divider(height: 10, color: Colors.grey).expand(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'or'.tr.toUpperCase(),
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        const Divider(height: 10, color: Colors.grey).expand(),
      ],
    );
  }
}
