import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/const/import_const.dart';

class BottomSheet2 extends StatelessWidget {
  const BottomSheet2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Container(
          width: Get.width,
          height: 150,
          color: Styles.purple5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 30),
              Text('Share to', style: Styles.mediumTextW700()),
              const SizedBox(height: 30),

              //List icon share.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const SizedBox(width: 10),
                  const Icon(Icons.keyboard_arrow_left, color: Styles.black2),
                  shareIcon('assets/icons/t1_whatsapp.png'),
                  shareIcon('assets/icons/t1_facebook.png'),
                  shareIcon('assets/icons/t1_instagram.png'),
                  shareIcon('assets/icons/t1_linkedin.png'),
                  const Icon(Icons.keyboard_arrow_right, color: Styles.black2),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          ),
        ).pOnly(top: 22),
        SizedBox(
          width: 45,
          height: 45,
          child: FloatingActionButton(
            onPressed: () => Get.back(),
            child: const Icon(Icons.close, color: Styles.purple6),
            backgroundColor: Colors.white,
          ),
        ).pOnly(right: 20),
      ],
    );
  }
}

Widget shareIcon(String iconPath) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Image.asset(iconPath, width: 28, height: 28, fit: BoxFit.fill),
  );
}
