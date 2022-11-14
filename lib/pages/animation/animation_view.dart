import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animation_controller.dart';

class AnimationView extends GetView<Animation1Controller> {
  const AnimationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'Animation',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
