import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';

class DefaultOutlineButton extends StatelessWidget {
  const DefaultOutlineButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = Styles.primaryColor,
    this.colorText = Styles.primaryColor,
    this.width = 150,
    this.height = 48,
    this.radius = 30,
    this.elevation = 2,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final Color color, colorText;
  final double width, height, radius, elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: color,
          shape: Styles.borderDialog(radius: radius),
          side: BorderSide(width: 1, color: colorText),
          backgroundColor: Colors.white,
          elevation: elevation,
        ),
        onPressed: onTap,
        child: AutoSizeText(
          text.tr.toUpperCase(),
          style: Styles.normalTextW700(color: colorText),
          maxLines: 1,
          minFontSize: 8,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
