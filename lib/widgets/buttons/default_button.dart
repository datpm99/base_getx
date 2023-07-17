import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = Styles.primaryColor,
    this.width = 150,
    this.height = 48,
    this.radius = 30,
    this.isUpper = true,
    this.elevation = 2,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  final Color color;
  final double width, height, radius, elevation;
  final bool isUpper;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          primary: color,
          elevation: elevation,
          shape: Styles.borderDialog(radius: radius),
        ),
        child: AutoSizeText(
          (isUpper) ? text.tr.toUpperCase() : text.tr,
          style: Styles.normalTextW700(color: Colors.white),
          maxLines: 1,
          minFontSize: 8,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
