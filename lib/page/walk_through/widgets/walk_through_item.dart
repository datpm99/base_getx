import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';

class WalkThroughItem extends StatelessWidget {
  const WalkThroughItem({
    super.key,
    required this.textContent,
    required this.image,
  });

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
            child: Image.network(
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
