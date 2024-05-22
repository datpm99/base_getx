import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/const/common_export.dart';
import '/utils/app_validation.dart';
import '/utils/input_formatter.dart';
import '/widget/buttons/button_widget.dart';
import '/widget/form/text_form_field_widget.dart';
import 'form_controller.dart';

class FormView extends GetView<FormController> {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Form', style: Styles.normalTextW700(size: 20)),
      ),
      body: Form(
        child: Builder(
          builder: (BuildContext ctx) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  TextFormFieldWidget(
                    ctrl: controller.nameCtrl,
                    hintText: 'Nhập tên',
                    validator: (val) => AppValidation.empty(val, 'UserName'),
                    textCapitalization: TextCapitalization.words,
                  ).pOnly(bottom: 12),
                  TextFormFieldWidget(
                    ctrl: controller.passwordCtrl,
                    hintText: 'Nhập password',
                    validator: (val) => AppValidation.empty(val, 'Password'),
                    isPassWord: true,
                  ),
                  const Divider(height: 50, color: Colors.grey),

                  //Input formatter.
                  TextFormFieldWidget(
                    ctrl: controller.cardNumberCtrl,
                    hintText: '1234-XXXX-XXXX-XXXX',
                    keyboardType: TextInputType.number,
                    validator: (val) => AppValidation.empty(val, 'Card number'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(20),
                      CardNumberInputFormatter(),
                    ],
                  ).pOnly(bottom: 12),
                  TextFormFieldWidget(
                    ctrl: controller.dateCtrl,
                    hintText: 'mm/yy',
                    keyboardType: TextInputType.number,
                    validator: (val) => AppValidation.empty(val, 'Date'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      DateNumberInputFormatter(),
                    ],
                  ).pOnly(bottom: 12),
                  TextFormFieldWidget(
                    ctrl: controller.moneyCtrl,
                    hintText: 'Nhập số tiền',
                    keyboardType: TextInputType.number,
                    validator: (val) => AppValidation.empty(val, 'Money'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      MoneyInputFormatter(),
                    ],
                  ).pOnly(bottom: 12),
                  TextFormFieldWidget(
                    ctrl: controller.trongTaiCtrl,
                    hintText: 'Nhập trọng tải',
                    keyboardType: TextInputType.number,
                    validator: (val) => AppValidation.empty(val, 'Trọng tải'),
                    inputFormatters: [
                      TrongTaiInputFormatter(),
                    ],
                  ).pOnly(bottom: 12),
                  TextFormFieldWidget(
                    ctrl: controller.numberRangeCtrl,
                    hintText: 'Nhập trong khoảng (1-99)',
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        AppValidation.empty(val, 'Number range'),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      NumericalRangeFormatter(min: 1, max: 99),
                    ],
                  ).pOnly(bottom: 12),
                  TextFormFieldWidget(
                    ctrl: controller.dauCauCtrl,
                    hintText: 'Nhập tên không dấu',
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        AppValidation.empty(val, 'Tên không dấu'),
                    inputFormatters: [
                      //FilteringTextInputFormatter.allow(RegExp('^[a-zA-Z]*')),
                      DauCauInputFormatter(),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ButtonWidget(
                    text: 'Submit',
                    onTap: () => controller.submitForm(ctx),
                  ),
                  const SizedBox(height: 20),
                ],
              ).p(16),
            );
          },
        ),
      ),
    );
  }
}
