import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/widgets/buttons/default_button.dart';
import 'unit_test_controller.dart';

class UnitTestView extends GetView<UnitTestController> {
  const UnitTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text('Unit Test', style: Styles.normalTextW700(size: 20)),
      ),
      body: Column(
        children: [
          GetBuilder<UnitTestController>(
            builder: (c) {
              return ListView.builder(
                itemCount: c.lstComment.length,
                padding: const EdgeInsets.all(10),
                itemBuilder: (ctx, index) => Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: Styles.boxShadow1(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('EMAIL: ${c.lstComment[index].email}'),
                      Text('NAME: ${c.lstComment[index].name}'),
                    ],
                  ),
                ),
              );
            },
          ).expand(),
          DefaultButton(
            text: 'Post comment',
            onTap: controller.postComment,
          ).pOnly(top: 10, bottom: 20),
        ],
      ),
    );
  }
}
