import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/const/import_const.dart';

class BottomSheet1 extends StatelessWidget {
  const BottomSheet1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          width: Get.width,
          height: 150,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg_bottom_sheet1.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),
              Text('Share to', style: Styles.mediumText()),
              const SizedBox(height: 25),

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
            onPressed: () {},
            child: const Icon(Icons.share, color: Styles.pink2),
            backgroundColor: Colors.white,
          ),
        )
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
