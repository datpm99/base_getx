import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import 'check_box_controller.dart';

class CheckBoxView extends GetView<CheckBoxController> {
  const CheckBoxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text('CheckBox', style: Styles.normalTextW700(size: 20)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Simple Checkbox', style: Styles.bigTextW700()),
          Obx(() {
            return Checkbox(
              value: controller.simpleCb.value,
              onChanged: controller.onChangedSimpleCb,
              activeColor: Styles.primaryColor, // checkbox color.
            );
          }),

          //Custom checkBox.
          Text('Custom Shape Checkbox', style: Styles.bigTextW700()),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                return Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: (controller.cusCb1.value)
                        ? Styles.primaryColor
                        : Colors.transparent,
                    border: Border.all(width: 1, color: Styles.black2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Theme(
                    data: ThemeData(unselectedWidgetColor: Colors.transparent),
                    child: Checkbox(
                      value: controller.cusCb1.value,
                      onChanged: controller.onChangedCusCb1,
                      activeColor: Colors.transparent,
                      checkColor: Colors.white,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                );
              }),

              //CusCb2.
              Obx(() {
                return Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Styles.black2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.transparent,
                    ),
                    child: Checkbox(
                      value: controller.cusCb2.value,
                      onChanged: controller.onChangedCusCb2,
                      activeColor: Colors.transparent,
                      checkColor: Styles.primaryColor,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                );
              }),

              //CusCb3.
              Obx(() {
                return Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Styles.black2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.transparent,
                    ),
                    child: Checkbox(
                      value: controller.cusCb3.value,
                      onChanged: controller.onChangedCusCb3,
                      activeColor: Colors.transparent,
                      checkColor: Styles.primaryColor,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                );
              }),
            ],
          ).pSymmetric(v: 20),

          //CheckBox Tile.
          Text('Checkbox Tile', style: Styles.bigTextW700()),
          Obx(() {
            return Card(
              elevation: 4,
              child: Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.black,
                ),
                child: CheckboxListTile(
                  value: controller.cbTile1.value,
                  onChanged: controller.onChangedCbTile1,
                  title: Text('Checkbox Tile', style: Styles.bigTextW700()),
                  subtitle: Text(
                    'Check box with title and subtitle',
                    style: Styles.normalText(color: Styles.grey23),
                  ),
                ),
              ),
            ).pOnly(bottom: 5, top: 10);
          }),

          //Cb tile2.
          Obx(() {
            return Card(
              elevation: 4,
              child: Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.black,
                ),
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  secondary: const Icon(
                    Icons.subscriptions,
                    color: Styles.black2,
                  ),
                  value: controller.cbTile2.value,
                  onChanged: controller.onChangedCbTile2,
                  title: Text(
                    'Checkbox Tile',
                    style: Styles.bigTextW700(),
                  ),
                  subtitle: Text(
                    'Custom Trailing value',
                    style: Styles.normalText(color: Styles.grey23),
                  ),
                ),
              ),
            ).pOnly(bottom: 5);
          }),

          //Cb tile3.
          Obx(() {
            return Card(
              elevation: 4,
              child: Theme(
                data: Theme.of(context).copyWith(
                  unselectedWidgetColor: Colors.black,
                ),
                child: CheckboxListTile(
                  value: controller.cbTile3.value,
                  secondary: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/avatar1.jpeg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  onChanged: controller.onChangedCbTile3,
                  title: Text(
                    'Checkbox Tile',
                    style: Styles.bigTextW700(),
                  ),
                  subtitle: Text(
                    'Custom Leading value ',
                    style: Styles.normalText(color: Styles.grey23),
                  ),
                ),
              ),
            );
          }),
        ],
      ).p(16),
    );
  }
}
