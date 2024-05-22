import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget(
      {super.key, required this.value, required this.onChanged});
  final bool value;
  final Function(bool?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Colors.grey[300],
      ),
      child: Checkbox(
        activeColor: Colors.lightBlue,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
