import 'package:flutter/material.dart';

import '/const/import_const.dart';
import '/pages/utility/before_after_image/before_after.dart';

class BeforeAfterImageView extends StatelessWidget {
  const BeforeAfterImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title:
            Text('Before After Image', style: Styles.normalTextW700(size: 20)),
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
