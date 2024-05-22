import 'package:flutter/material.dart';
import '/const/theme/styles.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
    required this.size,
    this.text = 'D',
    this.color = Styles.primaryColor,
  });
  final double size;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircleAvatar(
        backgroundColor: color,
        child: Text(text, style: Styles.bigText(color: Colors.white)),
      ),
    );
  }
}
