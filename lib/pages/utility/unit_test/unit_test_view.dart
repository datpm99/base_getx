import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/widgets/listview_widget.dart';
import 'unit_test_controller.dart';

class UnitTestView extends StatelessWidget {
  const UnitTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text('Unit Test', style: Styles.normalTextW700(size: 20)),
      ),
      body: SafeArea(
        child: GetBuilder<UnitTestController>(
          builder: (c) {
            return ListViewWidget(
              isLoading: c.isLoading,
              itemCount: c.lstUser.length,
              scrollController: c.scrollController,
              onRefresh: c.onRefresh,
              showIndicatorLoadMore: (!c.isLoadData),
              child: (ctx, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: Styles.boxShadow2(),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.network(
                          c.lstUser[index].avatar,
                          width: 48,
                          height: 48,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(c.lstUser[index].firstName +
                              ' ' +
                              c.lstUser[index].lastName),
                          Text(c.lstUser[index].email),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
