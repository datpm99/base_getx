import 'package:flutter/material.dart';
import '/const/import_const.dart';
import '/utils/app_validation.dart';
import '/widgets/get_input_text.dart';

class ProfileFields {
  GetInputTextConfig fullName = GetInputTextConfig(
    hint: 'full_name',
    maxLength: AppConfigs.maxLength255,
    onValidate: AppValidation.username,
    keyboardType: TextInputType.text,
    validationPlace: ValidationPlace.focus,
    textInputAction: TextInputAction.next,
    enabledBorder: Styles.inputBorder8(),
    focusedBorder: Styles.inputBorder8(color: Styles.primaryColor),
    errorBorder: Styles.inputBorder8(color: Colors.red),
    focusedErrorBorder: Styles.inputBorder8(color: Colors.red),
  );
  GetInputTextConfig email = GetInputTextConfig(
    hint: 'email',
    maxLength: AppConfigs.maxLength255,
    onValidate: AppValidation.email,
    keyboardType: TextInputType.emailAddress,
    validationPlace: ValidationPlace.focus,
    textInputAction: TextInputAction.next,
    enabledBorder: Styles.inputBorder8(),
    focusedBorder: Styles.inputBorder8(color: Styles.primaryColor),
    errorBorder: Styles.inputBorder8(color: Colors.red),
    focusedErrorBorder: Styles.inputBorder8(color: Colors.red),
  );

  GetInputTextConfig address = GetInputTextConfig(
    hint: 'address',
    maxLength: AppConfigs.maxLength255,
    keyboardType: TextInputType.text,
    validationPlace: ValidationPlace.focus,
    textInputAction: TextInputAction.done,
    enabledBorder: Styles.inputBorder8(),
    focusedBorder: Styles.inputBorder8(color: Styles.primaryColor),
    errorBorder: Styles.inputBorder8(color: Colors.red),
    focusedErrorBorder: Styles.inputBorder8(color: Colors.red),
  );
}
