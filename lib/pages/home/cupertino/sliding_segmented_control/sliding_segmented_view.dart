import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import 'sliding_segmented_controller.dart';

class SlidingSegmentedView extends StatelessWidget {
  const SlidingSegmentedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Sliding Segmented Control',
          style: Styles.normalTextW700(size: 20),
        ),
      ),
      body: GetBuilder<SlidingSegmentedController>(
        builder: (c) {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                child: CupertinoSlidingSegmentedControl(
                  children: {
                    0: Text(
                      'Home',
                      style: Styles.normalText(
                        color: (c.sliding == 0) ? Colors.black : Colors.grey,
                      ),
                    ).p(8),
                    1: Text(
                      'Booking',
                      style: Styles.normalText(
                        color: (c.sliding == 1) ? Colors.black : Colors.grey,
                      ),
                    ).p(8),
                    2: Text(
                      'Setting',
                      style: Styles.normalText(
                        color: (c.sliding == 2) ? Colors.black : Colors.grey,
                      ),
                    ).p(8),
                  },
                  groupValue: c.sliding,
                  onValueChanged: c.onValueChanged,
                ),
              ),
              if (c.sliding == 0) mPage("Home"),
              if (c.sliding == 1) mPage("Booking"),
              if (c.sliding == 2) mPage("Setting"),
            ],
          );
        },
      ),
    );
  }

  Widget mPage(var value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: Styles.mediumTextW700(),
        ).pOnly(left: 16),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
          child: Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
            'Lorem Ipsum has been the industry standard dummy text ever since the 1500s, '
            'when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            style: Styles.smallText(color: Styles.grey23),
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}
