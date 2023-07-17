import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/widgets/buttons/default_button.dart';
import '/widgets/dots_indicator/dots_indicator.dart';
import 'walk_through_controller.dart';

class WalkThroughView extends StatelessWidget {
  const WalkThroughView({Key? key}) : super(key: key);

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
                    children: const <Widget>[
                      ItemWalkThrough(
                        textContent: 'Latest News Daily',
                        image: 'images/theme4/t4_walk1.png',
                      ),
                      ItemWalkThrough(
                        textContent: 'Regular Notifications',
                        image: 'images/theme4/t4_walk2.png',
                      ),
                      ItemWalkThrough(
                        textContent: 'Award Winning App',
                        image: 'images/theme4/t4_walk3.png',
                      ),
                    ],
                    onPageChanged: c.onPageChanged,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DefaultButton(
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

class ItemWalkThrough extends StatelessWidget {
  const ItemWalkThrough({
    Key? key,
    required this.textContent,
    required this.image,
  }) : super(key: key);

  final String textContent;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: Get.height * 0.05),
            height: Get.height * 0.5,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Image.network(
                  'https://assets.iqonic.design/old-themeforest-images/prokit/$image',
                  width: Get.width * 0.8,
                  height: Get.height * 0.4,
                  loadingBuilder: (context, child, loadingProgress) {
                    return loadingProgress == null
                        ? child
                        : const CircularProgressIndicator();
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: Get.height * 0.08),
          Text(textContent, style: Styles.bigTextW700()),
          const SizedBox(height: 10),
          Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.simply duumy text',
            style: Styles.normalText(color: Styles.grey23),
            textAlign: TextAlign.center,
          ).pSymmetric(h: 28),
        ],
      ),
    );
  }
}
