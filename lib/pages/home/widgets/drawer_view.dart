import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/home/home_controller.dart';

class DrawerView extends GetView<HomeController> {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Drawer(
        backgroundColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 40),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Styles.black2),
                      onPressed: controller.closeDrawer,
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.orange),
                      color: Styles.primaryColor,
                      image: const DecorationImage(
                        image: AssetImage('assets/images/avatar1.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(height: 5),
                  Text("Phạm Minh Đạt", style: Styles.bigTextW600()),
                  Text("paindat9911@gmail.com", style: Styles.normalText(color: Colors.grey)),

                  //Item.
                  const SizedBox(height: 20),
                  itemList(Icons.home, "Home"),
                  const Divider(),
                  itemList(Icons.person_pin, "My profile"),
                  const Divider(),
                  itemList(Icons.message, "Messages"),
                  const Divider(),
                  itemList(Icons.notifications, "Notifications"),
                  const Divider(),
                  itemList(Icons.settings, "Settings"),
                  const Divider(),
                  itemList(Icons.email, "Contact us"),
                  const Divider(),
                  itemList(Icons.info_outline, "Help"),
                  const Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemList(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Styles.black2),
        const SizedBox(width: 10),
        Text(title, style: Styles.normalText()),
      ],
    ).pOnly(top: 15);
  }
}

class OvalRightBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width - 50, 0);
    path.quadraticBezierTo(
        size.width, size.height / 4, size.width, size.height / 2);
    path.quadraticBezierTo(size.width, size.height - (size.height / 4),
        size.width - 40, size.height);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
