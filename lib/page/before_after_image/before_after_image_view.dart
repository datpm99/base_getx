import 'package:base_get/const/common_export.dart';
import 'package:flutter/material.dart';
import 'before_after.dart';

class BeforeAfterImageView extends StatelessWidget {
  const BeforeAfterImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text(
          'Before After Image',
          style: Styles.normalTextW700(size: 20),
        ),
      ),
      body: Center(
        child: BeforeAfter(
          beforeImage: Image.asset('assets/images/img_mountain_before.png'),
          afterImage: Image.asset('assets/images/img_mountain_after.png'),
        ),
      ),
    );
  }
}
