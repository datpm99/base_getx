import '/const/app_configs.dart';
import 'package:flutter/material.dart';

class OtpFormItem extends StatelessWidget {
  const OtpFormItem({
    Key? key,
    this.autoFocus = false,
    required this.focusNode,
    required this.onChange,
    required this.controller,
  }) : super(key: key);
  final bool autoFocus;
  final FocusNode focusNode;
  final Function(String) onChange;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppConfigs.otpWidth,
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        focusNode: focusNode,
        maxLength: 1,
        style: const TextStyle(fontSize: 24),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: onChange,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          counterText: '',
        ),
      ),
    );
  }
}
