import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/home/widgets/base_list_item.dart';
import 'detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'WalkThrough Screens',
          style: Styles.normalTextW700(size: 20),
        ),
      ),
      body: BaseListItem(
        lstObj: controller.lstDetail,
        onTab: controller.showDetail,
      ),
    );
  }
}
