import 'package:flutter/material.dart';
import '/const/import_const.dart';
import '/utils/app_validation.dart';
import '/widgets/get_input_text.dart';

class SignInFields {
  GetInputTextConfig phone = GetInputTextConfig(
    hint: 'phone',
    maxLength: AppConfigs.maxLength11,
    //onValidate: AppValidation.phone,
    keyboardType: TextInputType.phone,
    validationPlace: ValidationPlace.focus,
    textInputAction: TextInputAction.next,
    enabledBorder: Styles.inputBorder8(color: Styles.grey5),
    focusedBorder: Styles.inputBorder8(color: Styles.primaryColor),
    errorBorder: Styles.inputBorder8(color: Colors.red),
    focusedErrorBorder: Styles.inputBorder8(color: Colors.red),
  );

  GetInputTextConfig password = GetInputTextConfig(
    hint: 'password',
    maxLength: AppConfigs.maxLength50,
    //onValidate: AppValidation.password,
    isPassword: true,
    keyboardType: TextInputType.visiblePassword,
    validationPlace: ValidationPlace.focus,
    textInputAction: TextInputAction.done,
    enabledBorder: Styles.inputBorder8(color: Styles.grey5),
    focusedBorder: Styles.inputBorder8(color: Styles.primaryColor),
    errorBorder: Styles.inputBorder8(color: Colors.red),
    focusedErrorBorder: Styles.inputBorder8(color: Colors.red),
  );
}
