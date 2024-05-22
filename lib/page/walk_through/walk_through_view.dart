import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';
import '/widget/buttons/button_widget.dart';
import '/widget/dots_indicator/dots_indicator.dart';
import 'walk_through_controller.dart';
import 'widgets/walk_through_item.dart';

class WalkThroughView extends StatelessWidget {
  const WalkThroughView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: GetBuilder<WalkThroughController>(
          builder: (c) {
            return Stack(
              children: <Widget>[
                Image.asset(
                  'assets/images/bg_walk_through2.png',
                  width: Get.width * 0.8,
                  height: Get.height * 0.5,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: Get.width,
                  height: Get.height,
                  child: PageView(
                    onPageChanged: c.onPageChanged,
                    children: const <Widget>[
                      WalkThroughItem(
                        textContent: 'Latest News Daily',
                        image: 'images/theme4/t4_walk1.png',
                      ),
                      WalkThroughItem(
                        textContent: 'Regular Notifications',
                        image: 'images/theme4/t4_walk2.png',
                      ),
                      WalkThroughItem(
                        textContent: 'Award Winning App',
                        image: 'images/theme4/t4_walk3.png',
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonWidget(
                    text: 'Skip',
                    color: Styles.blue10,
                    elevation: 0,
                    onTap: c.onSkip,
                  ).pOnly(bottom: 80),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DotsIndicator(
                    dotsCount: 3,
                    position: c.currentPage,
                    decorator: const DotsDecorator(
                      color: Styles.grey22,
                      activeColor: Styles.blue10,
                    ),
                  ).pOnly(bottom: 16),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

