import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/widgets/dots_indicator/dots_indicator.dart';
import 'walk_through_1_controller.dart';

class WalkThrough1View extends StatelessWidget {
  const WalkThrough1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<WalkThrough1Controller>(
        builder: (c) {
          return Column(
            children: [
              PageView(
                onPageChanged: c.onPageChanged,
                children: const [
                  ItemWalkThrough(
                    title: 'Add Files',
                    content:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                    img: 'images/theme1/t1_walk1.png',
                  ),
                  ItemWalkThrough(
                    title: 'Select Files',
                    content:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                    img: 'images/theme1/t1_walk2.png',
                  ),
                  ItemWalkThrough(
                    title: 'Share Files',
                    content:
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. ',
                    img: 'images/theme1/t1_walk3.png',
                  ),
                ],
              ).expand(),

              //Bottom.
              DotsIndicator(
                dotsCount: 3,
                position: c.currentPage,
                decorator: const DotsDecorator(
                  size: Size.square(5.0),
                  activeSize: Size.square(8.0),
                  color: Styles.grey22,
                  activeColor: Styles.pink2,
                ),
              ),
              SizedBox(height: Get.height * 0.07),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Styles.pink2,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "Skip",
                    style: Styles.smallText(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(
                'assets/icons/t1_walk_bottom.png',
                width: Get.width,
                height: Get.height * 0.12,
                fit: BoxFit.fill,
              ),
            ],
          );
        },
      ),
    );
  }
}

class ItemWalkThrough extends StatelessWidget {
  const ItemWalkThrough(
      {Key? key, required this.title, required this.content, required this.img})
      : super(key: key);
  final String title, content, img;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: Get.height / 15),
        Text(
          title,
          style: Styles.normalTextW700(size: 20, color: Styles.pink2),
        ),
        SizedBox(height: Get.height / 30),
        Image.network(
          'https://assets.iqonic.design/old-themeforest-images/prokit/$img',
          width: Get.height * 0.35,
          height: Get.height * 0.35,
          loadingBuilder: (context, child, loadingProgress) {
            return loadingProgress == null
                ? child
                : const CircularProgressIndicator();
          },
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error);
          },
        ),
        SizedBox(height: Get.height / 30),
        Text(
          content,
          style: Styles.mediumText(),
          textAlign: TextAlign.center,
        ).pSymmetric(h: 32),
      ],
    );
  }
}
