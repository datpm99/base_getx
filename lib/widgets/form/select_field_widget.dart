import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/models/select_model.dart';
import '/utils/app_validation.dart';
import '/widgets/buttons/default_button.dart';
import 'text_form_field_widget.dart';

class SelectFieldWidget extends StatelessWidget {
  const SelectFieldWidget({
    Key? key,
    required this.ctrl,
    required this.title,
    required this.hintText,
    required this.titleBottomSheet,
    required this.listData,
    required this.onSelected,
  }) : super(key: key);
  final TextEditingController ctrl;
  final String title, hintText, titleBottomSheet;
  final List<SelectModel> listData;
  final Function(SelectModel) onSelected;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      ctrl: ctrl,
      hintText: hintText,
      validator: (val) => AppValidation.empty(val, title),
      readOnly: true,
      isShowIcClear: false,
      onTap: () => Get.bottomSheet(BottomSheetSelectData(
        title: titleBottomSheet,
        listData: listData,
        onSelected: onSelected,
      )),
    );
  }
}

class BottomSheetSelectData extends StatelessWidget {
  const BottomSheetSelectData({
    Key? key,
    required this.title,
    required this.listData,
    required this.onSelected,
  }) : super(key: key);
  final String title;
  final List<SelectModel> listData;
  final Function(SelectModel) onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Styles.boxDecoration3(radius: 12),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 44),
                  Text(title, style: Styles.normalTextW700()),
                  InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(Icons.close, color: Colors.black).p(10),
                  ),
                ],
              ),
              const Divider(height: 1),
              ...listData.map((e) {
                return InkWell(
                  onTap: () => onSelected(e),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: Colors.grey[300]!, width: 0.5),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          e.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ).expand(),
                        Obx(() {
                          if (!e.isSelected.value) {
                            return const SizedBox(height: 24);
                          }

                          return const Icon(
                            Icons.check,
                            color: Styles.primaryColor,
                          );
                        }),
                      ],
                    ),
                  ),
                );
              }),
              const SizedBox(height: 20),
              DefaultButton(
                width: Get.width,
                text: 'Xong',
                isUpper: false,
                radius: 8,
                height: 40,
                onTap: () => Get.back(),
              ).pSymmetric(h: 15),
            ],
          ),
        ),
      ),
    );
  }
}
