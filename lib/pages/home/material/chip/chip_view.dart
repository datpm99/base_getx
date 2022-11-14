import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import 'chip_controller.dart';

class ChipView extends GetView<ChipController> {
  const ChipView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Chip', style: Styles.normalTextW700(size: 20)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text("Simple Chip", style: Styles.mediumTextW700()).p(16),
          Row(
            children: [
              Chip(
                deleteIcon: const Icon(Icons.close, size: 20),
                onDeleted: () {},
                avatar: const Icon(Icons.account_circle, color: Styles.black2),
                label: const Text("Task 1"),
              ).pOnly(left: 16),
              const Chip(
                label: Text('Task 2'),
              ).pOnly(left: 16),
            ],
          ),
          const Divider(thickness: 1),

          //Choice chip.
          Text("Choice Chip", style: Styles.mediumTextW700()).p(16),
          Obx(() {
            return Row(
              children: [
                ...List<Widget>.generate(3, (int index) {
                  return ChoiceChip(
                    label: Text('Item $index'),
                    selectedColor: Styles.primaryColor,
                    selected: (controller.choiceChip.value == index),
                    onSelected: (val) => controller.onChangedChoiceChip(index),
                  ).pOnly(left: 16);
                }).toList(),
              ],
            );
          }),
          const Divider(thickness: 1),

          //Filter chip.
          Text("Filter Chip", style: Styles.mediumTextW700()).p(16),
          Obx(() {
            return Row(
              children: [
                ...List<Widget>.generate(3, (int index) {
                  return FilterChip(
                    label: Text('Item $index'),
                    labelStyle: Styles.normalText(color: Colors.white),
                    shape: const StadiumBorder(side: BorderSide(width: 0.5)),
                    selected: (controller.filterChip.value == index),
                    selectedColor: Styles.primaryColor,
                    checkmarkColor: Colors.white,
                    onSelected: (val) => controller.onChangedFilterChip(index),
                  ).pOnly(left: 16);
                }).toList(),
              ],
            );
          }),
          const Divider(thickness: 1),

        ],
      ),
    );
  }
}
