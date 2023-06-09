import 'package:base_getx/widgets/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import 'home_controller.dart';
import 'widgets/base_list_item.dart';
import 'widgets/cus_tab.dart';
import 'widgets/drawer_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: false,
        title: Text('Base GetX', style: Styles.normalTextW700(size: 20)),
        actions: [
          Image.asset('assets/images/logo.png', width: 45, height: 45)
              .pOnly(right: 10),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              const CusTab(text: 'Material', tab: 0).expand(),
              const CusTab(text: 'Cupertino', tab: 1, borderLeft: true)
                  .expand(),
            ],
          ),

          // TicketWidget(
          //   drawArc: false,
          //   drawShadow: false,
          //   triangleAxis: Axis.horizontal,
          //   backgroundColor: Colors.transparent,
          //   contentBackgroundColor: Styles.green8,
          //   dividerStrokeWidth: 0.5,
          //   dividerColor: Styles.green9,
          //   triangleSize: const Size(12, 6),
          //   trianglePos: .8,
          //   child: IntrinsicWidth(
          //     child: Container(
          //       constraints: const BoxConstraints(
          //         minWidth: 160,
          //         minHeight: 56,
          //       ),
          //       child: Row(
          //         children: [
          //           Expanded(
          //             flex: 8,
          //             child: Padding(
          //               padding: const EdgeInsets.only(left: 10, right: 10),
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     'Giảm 10.000đ',
          //                     style:
          //                         Styles.mediumTextW500(color: Styles.yellow6),
          //                   ),
          //                   const SizedBox(height: 4),
          //                   Text(
          //                     'Đơn từ 1.000.000đ',
          //                     style: Styles.smallText(color: Colors.white),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //           const Expanded(
          //             flex: 2,
          //             child: Padding(
          //               padding: EdgeInsets.symmetric(horizontal: 8),
          //               child: Icon(Icons.check_circle, color: Colors.white),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),

          //List widget.
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.onPageChanged,
            children: [
              BaseListItem(
                lstObj: controller.lstWidgetMaterial,
                onTab: controller.onNavigator,
              ),
              BaseListItem(
                lstObj: controller.lstWidgetCupertino,
                onTab: controller.onNavigator,
              ),
            ],
          ).expand(),
        ],
      ),
      drawer: const DrawerView(),
    );
  }
}
