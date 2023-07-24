import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.ctrl,
    required this.hintText,
    this.validator,
    this.validateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.keyboardType,
    this.inputFormatters,
    this.readOnly = false,
    this.enabled = true,
    this.contentPadding = const EdgeInsets.fromLTRB(12, 15, 12, 15),
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.isPassWord = false,
    this.onTap,
    this.isShowIcClear = true,
  }) : super(key: key);
  final TextEditingController ctrl;
  final String hintText;
  final String? Function(String?)? validator;
  final AutovalidateMode validateMode;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly, enabled, isPassWord, isShowIcClear;
  final EdgeInsetsGeometry? contentPadding;
  final Widget? suffixIcon, prefixIcon;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final VoidCallback? onTap;

  /// [textCapitalization] TextCapitalization.characters
  // OUTPUT : FLUTTER CODE CAMP

  /// [textCapitalization] TextCapitalization.words
  // OUTPUT : Flutter Code Camp

  /// [textCapitalization] TextCapitalization.sentences
  // OUTPUT : Flutter code camp

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  RxBool obscureText = false.obs;
  RxBool showIconClear = false.obs;

  @override
  void initState() {
    super.initState();
    obscureText.value = widget.isPassWord;
    showIconClear.value = widget.ctrl.text.isNotEmpty;
  }

  void clearText() {
    widget.ctrl.clear();
    showIconClear.value = false;
    setState(() {});
  }

  Widget? getSuffixIcon() {
    if (widget.isPassWord) {
      return InkWell(
        splashColor: Colors.transparent,
        onTap: () => obscureText.value = !obscureText.value,
        child: Icon(
          (obscureText.value)
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: Styles.grey3,
        ),
      );
    }

    // Icon clear.
    if (widget.suffixIcon == null && showIconClear.value && widget.isShowIcClear) {
      return InkWell(
        onTap: clearText,
        splashColor: Colors.transparent,
        child: const Icon(Icons.cancel_outlined, color: Styles.grey3),
      );
    }

    return widget.suffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: widget.ctrl,
        validator: widget.validator,
        autovalidateMode: widget.validateMode,
        onChanged: (String val) {
          if (widget.onChanged != null) widget.onChanged!(val);
          showIconClear.value = val.isNotEmpty;
        },
        style: Styles.normalText(),
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        maxLength: widget.maxLength,
        textCapitalization: widget.textCapitalization,
        obscureText: obscureText.value,
        onTap: widget.onTap,
        autocorrect: false,
        enableSuggestions: false,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: widget.contentPadding,
          hintText: widget.hintText,
          prefixIcon: widget.prefixIcon,
          suffixIcon: getSuffixIcon(),
          hintStyle: Styles.normalText(color: Styles.grey5),
          errorStyle: Styles.smallText(color: Styles.red2).copyWith(height: 1),
          errorMaxLines: 2,
          counterStyle:
              Styles.smallText(color: Styles.grey8).copyWith(height: 1),
          border: Styles.inputBorder8(),
          enabledBorder: Styles.inputBorder8(),
          focusedBorder: Styles.inputBorder8(color: Styles.primaryColor),
          errorBorder: Styles.inputBorder8(color: Styles.red2),
          focusedErrorBorder: Styles.inputBorder8(color: Styles.red2),
        ),
      );
    });
  }
}
