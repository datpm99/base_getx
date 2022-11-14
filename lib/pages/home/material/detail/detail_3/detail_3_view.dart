import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';

class Detail3View extends StatelessWidget {
  const Detail3View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: Get.height * 0.77,
                  margin: const EdgeInsets.fromLTRB(16, 30, 16, 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: Styles.boxShadow2(),
                  ),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                        child: Image.network(
                          'https://assets.iqonic.design/old-themeforest-images/prokit/images/theme9/t9_climb.png',
                          fit: BoxFit.cover,
                          height: Get.height * 0.3,
                          width: Get.width,
                        ),
                      ),
                      Text(
                        'Project Management',
                        style: Styles.normalTextW700(size: 20),
                      ).pOnly(top: 16, bottom: 8),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Styles.green7,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '\$30.80',
                          style:
                              Styles.normalText(color: Colors.white, size: 20),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          ItemCourse(title: '1.6K', subTitle: 'Students'),
                          ItemCourse(title: '5.0', subTitle: 'Rating'),
                          ItemCourse(title: '37', subTitle: 'Lectures'),
                        ],
                      ),
                    ],
                  ),
                ),

                //Text bottom.
                Column(
                  children: <Widget>[
                    const Icon(Icons.keyboard_arrow_up, color: Styles.black4),
                    Text(
                      'Swipe up to show course contents',
                      style: Styles.mediumText(color: Styles.black4),
                    )
                  ],
                ).pOnly(top: 16),
              ],
            ),

            //Page2.
            Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.close, color: Styles.black2),
                  ),
                ),
                Text(
                  'Project Management',
                  style: Styles.normalTextW700(size: 20),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                  margin: const EdgeInsets.only(bottom: 16, top: 10),
                  decoration: BoxDecoration(
                    color: Styles.green7,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '\$30.80',
                    style: Styles.normalText(color: Colors.white, size: 20),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: Get.height * 0.025,
                      child: const Text('T'),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      'Hannah Tran',
                      style: Styles.mediumText(color: Styles.blue11),
                    ),
                    const Spacer(),

                    //Rate.
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Text(
                      '5.0',
                      style: Styles.mediumTextW700(color: Colors.amber),
                    ).pOnly(left: 3),
                  ],
                ).pOnly(left: 16, right: 16, bottom: 20),

                //Info.
                const ItemQuestion(
                  number: 1,
                  title: 'Introduction',
                  subTitle: 'About this course and overview',
                  note: 'Video',
                ),
                const ItemQuestion(
                  number: 2,
                  title: 'What is management?',
                  subTitle: 'Basics and introduction',
                  note: 'Article',
                ),
                const ItemQuestion(
                  number: 3,
                  title: 'How does your decision effect project?',
                  subTitle: 'Learn the  decision effect',
                  note: 'Presentation',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ItemCourse extends StatelessWidget {
  const ItemCourse({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.network(
          'https://assets.iqonic.design/old-themeforest-images/prokit/images/theme9/t9_ic_cup.png',
          height: 20,
          width: 20,
        ),
        const SizedBox(height: 4),
        Text(title, style: Styles.bigTextW700()),
        Text(subTitle, style: Styles.mediumText(color: Styles.grey23)),
      ],
    ).pSymmetric(h: 16);
  }
}

class ItemQuestion extends StatelessWidget {
  const ItemQuestion({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.note,
    required this.number,
  }) : super(key: key);
  final String title, subTitle, note;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text('$number', style: Styles.mediumText(color: Styles.black4)),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title, style: Styles.mediumTextW700()),
            Text(subTitle, style: Styles.mediumText(color: Styles.black4))
                .pSymmetric(v: 5),
            Text(note, style: Styles.mediumText(color: Styles.blue11))
          ],
        ),
      ],
    ).pOnly(left: 16, right: 16, bottom: 16);
  }
}
