import 'package:flutter/material.dart';

class CusImageWidget extends StatelessWidget {
  const CusImageWidget({
    super.key,
    required this.asset,
    this.size = 24.0,
    this.fit = BoxFit.contain,
    this.border = 0.0,
  });
  final String asset;
  final double size, border;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(border),
      child: Image.asset(
        asset,
        width: size,
        height: size,
        fit: fit,
      ),
    );
  }
}