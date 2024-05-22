import 'package:flutter/material.dart';

class LoaderCircular extends StatelessWidget {
  const LoaderCircular({
    super.key,
    this.size = 64.0,
    this.padding = 20.0,
    this.bgColor = Colors.white,
  });
  final double size, padding;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        backgroundColor: Colors.white,
      ),
    );
  }
}
