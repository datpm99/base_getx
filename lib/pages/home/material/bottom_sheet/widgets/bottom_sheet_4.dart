import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/const/import_const.dart';

class BottomSheet4 extends StatelessWidget {
  const BottomSheet4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              height: Get.height - 250,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomLeft,
                  colors: [Styles.grey18, Styles.grey19],
                ),
              ),
            ).pOnly(top: 80),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    'https://assets.iqonic.design/old-themeforest-images/prokit/images/theme11/T11_ic_Music1.jpeg',
                    fit: BoxFit.fill,
                    height: 200,
                    width: 200,
                  ),
                ).centered(),
                Row(
                  children: <Widget>[
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. sed do eisumod tempor incididunt ut labore et dolore mangna aliqua.',
                      style: Styles.mediumTextW500(color: Styles.grey20),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ).pOnly(right: 10).expand(),
                    Image.asset(
                      'assets/icons/T11_ic_Expand.png',
                      fit: BoxFit.fill,
                      height: 30,
                      width: 30,
                    ),
                  ],
                ).pSymmetric(v: 32),
                Row(
                  children: <Widget>[
                    Text(
                      'Spark Fly',
                      style: Styles.normalTextW700(size: 20),
                    ).expand(),
                    Image.asset(
                      'assets/icons/T11_ic_Shuffle.png',
                      fit: BoxFit.fill,
                      height: 20,
                      width: 20,
                      color: Colors.pinkAccent,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Imagine Dragons Smoke + mirrors',
                      style: Styles.normalText(color: Styles.green6),
                    ),
                  ],
                ).pSymmetric(v: 15),
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Styles.grey21.withOpacity(0.2),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Styles.green6),
                ).pSymmetric(v: 16),
                Text(
                  '04:50',
                  style: Styles.normalText(color: Styles.green6),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Icon(
                      Icons.skip_previous,
                      size: 70,
                      color: Colors.white,
                    ),
                    const Icon(
                      Icons.pause_circle_filled,
                      size: 100,
                      color: Styles.green6,
                    ).pOnly(left: 4, right: 4),
                    const Icon(
                      Icons.skip_next,
                      size: 70,
                      color: Colors.white,
                    ),
                  ],
                ).pOnly(top: 40),
              ],
            ).pSymmetric(h: 16),
          ],
        ),
      ),
    );
  }
}
