import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/utils/app_validation.dart';
import '/utils/input_formatter.dart';
import '/widgets/buttons/default_button.dart';
import '/widgets/form/date_field_widget.dart';
import '/widgets/form/text_form_field_widget.dart';
import 'form_controller.dart';

class FormView extends GetView<FormController> {
  const FormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Form', style: Styles.normalTextW700(size: 20)),
      ),
      body: SafeArea(
        child: Form(
          child: Builder(
            builder: (BuildContext ctx) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormFieldWidget(
                      ctrl: controller.nameCtrl,
                      hintText: 'Nhập tên',
                      validator: AppValidation.username,
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
                    const Divider(height: 50, color: Colors.grey),

                    //DateTime picker.
                    DateFieldWidget(
                      ctrl: controller.dateSelectCtrl,
                      title: 'Date',
                      hintText: 'Chọn ngày',
                      titleBottomSheet: 'Chọn ngày',
                      suffixIcon: const Icon(Icons.date_range),
                      onChangedDate: controller.onChangedDate,
                      mode: CupertinoDatePickerMode.date,
                    ).pOnly(bottom: 12),
                    DateFieldWidget(
                      ctrl: controller.timeSelectCtrl,
                      title: 'Time',
                      hintText: 'Chọn giờ',
                      titleBottomSheet: 'Chọn giờ',
                      suffixIcon: const Icon(Icons.access_time),
                      onChangedDate: controller.onChangedTime,
                      mode: CupertinoDatePickerMode.time,
                    ).pOnly(bottom: 12),
                    DefaultButton(
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
      ),
    );
  }
}
