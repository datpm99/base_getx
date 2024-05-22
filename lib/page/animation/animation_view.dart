import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';
import 'animation_controller.dart';

class AnimationView extends GetView<Animation1Controller> {
  const AnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text('Animation', style: Styles.normalTextW700(size: 20)),
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
