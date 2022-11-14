import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/const/import_const.dart';

class ItemUser extends StatelessWidget {
  const ItemUser({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 20),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          primary: Styles.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.grey[100],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            const SizedBox(width: 10),
            Text(text.tr, style: Styles.normalText()).expand(),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
