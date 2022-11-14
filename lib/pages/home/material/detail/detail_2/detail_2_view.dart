import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/models/obj_model.dart';
import 'detail_2_controller.dart';

class Detail2View extends GetView<Detail2Controller> {
  const Detail2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //Background img.
          Image.network(
            'https://assets.iqonic.design/old-themeforest-images/prokit/images/theme7/t7_ic_thailand_beach.jpg',
            fit: BoxFit.cover,
            width: Get.width,
          ),

          //List hotels
          SingleChildScrollView(
            padding: EdgeInsets.only(top: Get.width * 0.2),
            child: Container(
              height: Get.height - 80,
              margin: EdgeInsets.only(top: Get.width / 4),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Best Hotels', style: Styles.bigTextW700()),
                      Text(
                        'See all',
                        style: Styles.mediumText(color: Styles.grey23),
                      ),
                    ],
                  ).p(16),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: Get.width * 0.5,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(right: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.lstHotel.length,
                      itemBuilder: (context, index) {
                        return Hotels(model: controller.lstHotel[index]);
                      },
                    ),
                  ),

                  //Popular.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Popular Hotels', style: Styles.bigTextW700()),
                      Text(
                        'See all',
                        style: Styles.mediumText(color: Styles.grey23),
                      ),
                    ],
                  ).p(16),
                  SizedBox(
                    height: Get.width * 0.5,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(right: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.lstHotel.length,
                      itemBuilder: (context, index) {
                        return Hotels(model: controller.lstHotel[index]);
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),

          //Icon back.
          Container(
            margin: const EdgeInsets.only(top: 35, left: 16),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.keyboard_arrow_left,
                    color: Styles.grey23, size: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Hotels extends StatelessWidget {
  const Hotels({Key? key, required this.model}) : super(key: key);
  final ObjModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 16),
          width: Get.width * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://assets.iqonic.design/old-themeforest-images/prokit/' +
                      model.image,
                  height: Get.width * 0.28,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 4),
              Text(model.title, style: Styles.mediumTextW500()),
              Text(
                "Starting \$399",
                style: Styles.normalText(color: Styles.grey24),
              ),
              Row(
                children: [
                  Text(
                    model.subTitle,
                    style: Styles.normalText(color: Styles.grey24),
                  ),
                  const Icon(Icons.star_border, color: Colors.amber, size: 16),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
