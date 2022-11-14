import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';

class Picker extends StatelessWidget {
  Picker({Key? key}) : super(key: key);

  List countryName = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Bangladesh",
    "Brazil",
    "Colombia",
    "Denmark",
    "Estonia",
    "France",
    "Guinea-Bissau",
    "Holy See",
    "India",
    "Japan"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Text('Cancel', style: Styles.bigTextW700()),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Text('Done', style: Styles.bigTextW700()),
              ),
            ],
          ).p(8),
          SizedBox(
            height: 200,
            child: CupertinoPicker(
              backgroundColor: Colors.white,
              itemExtent: 30,
              children: countryName.map((e) {
                return Text(e, style: Styles.bigText());
              }).toList(),
              onSelectedItemChanged: (int val) {},
            ),
          ),
        ],
      ),
    );
  }
}
