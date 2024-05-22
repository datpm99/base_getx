import 'package:flutter/material.dart';

class ObjModel {
  ObjModel({
    required this.title,
    this.subTitle = '',
    this.route = '',
    this.image = '',
    this.color = Colors.white,
  });

  String title;
  String subTitle;
  String image;
  String route;
  Color color;
}
