import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/widgets/dots_indicator/dots_indicator.dart';
import 'walk_through_2_controller.dart';

class WalkThrough2View extends StatelessWidget {
  const WalkThrough2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: GetBuilder<WalkThrough2Controller>(
          builder: (c) {
            return Column(
              children: <Widget>[
                PageView(
                  children: const <Widget>[
                    ItemWalkThrough2(image: 'images/theme2/theme2_walk_1.png'),
                    ItemWalkThrough2(image: 'images/theme2/theme2_walk_2.png'),
                    ItemWalkThrough2(image: 'images/theme2/theme2_walk_3.png'),
                  ],
                  onPageChanged: c.onPageChanged,
                ).expand(),
                DotsIndicator(
                  dotsCount: 3,
                  position: c.currentPage,
                  decorator: const DotsDecorator(
                    color: Styles.grey22,
                    activeColor: Styles.purple6,
                  ),
                ),

                //Text.
                const SizedBox(height: 20),
                Text(
                  c.titles[c.currentPage],
                  style: Styles.normalTextW700(size: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  c.subTitles[c.currentPage],
                  style: Styles.bigText(color: Styles.grey23),
                  textAlign: TextAlign.center,
                ).pSymmetric(h: 24),
                SizedBox(height: Get.height * 0.1),

                //Button.
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80),
                    ),
                  ),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      gradient: const LinearGradient(
                        colors: <Color>[Styles.purple6, Styles.purple8],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: Styles.bigText(color: Colors.white),
                      ),
                    ),
                  ),
                ).p(16),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ItemWalkThrough2 extends StatelessWidget {
  const ItemWalkThrough2({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/bg_walk_through1.png',
            fit: BoxFit.fill,
            width: Get.width,
            height: Get.height / 1.7,
          ),
          Container(
            width: Get.width,
            height: Get.height / 1.7,
            alignment: Alignment.center,
            child: Image.network(
              'https://assets.iqonic.design/old-themeforest-images/prokit/$image',
              width: 300,
              height: Get.height / 2.5,
              loadingBuilder: (context, child, loadingProgress) {
                return loadingProgress == null
                    ? child
                    : const CircularProgressIndicator();
              },
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ],
      ),
    );
  }
}
