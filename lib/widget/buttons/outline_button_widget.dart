import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';

class OutlineButtonWidget extends StatelessWidget {
  const OutlineButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Styles.primaryColor,
    this.colorText = Styles.primaryColor,
    this.width = 150,
    this.height = 48,
    this.radius = 30,
    this.elevation = 2,
    this.isUpper = true,
    this.styles,
    this.child,
  });
  final String text;
  final VoidCallback onTap;
  final Color color, colorText;
  final double width, height, radius, elevation;
  final bool isUpper;
  final TextStyle? styles;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          shape: Styles.borderDialog(radius: radius),
          side: BorderSide(width: 1, color: colorText),
          backgroundColor: Colors.white,
          elevation: elevation,
        ),
        onPressed: onTap,
        child: (child != null)
            ? child
            : Text(
                (isUpper) ? text.tr.toUpperCase() : text.tr,
                style: (styles != null)
                    ? styles
                    : Styles.mediumTextW700(color: Colors.white),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
      ),
    );
  }
}
