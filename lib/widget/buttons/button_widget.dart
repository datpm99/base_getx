import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.color = Styles.primaryColor,
    this.width = 150,
    this.height = 48,
    this.radius = 30,
    this.isUpper = true,
    this.elevation = 2,
    this.styles,
    this.child,
  });
  final String text;
  final VoidCallback onTap;
  final Color color;
  final double width, height, radius, elevation;
  final bool isUpper;
  final TextStyle? styles;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: elevation,
          shape: Styles.borderDialog(radius: radius),
        ),
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
