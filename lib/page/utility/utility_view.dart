import 'package:base_get/const/common_export.dart';
import 'package:base_get/widget/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utility_controller.dart';

class UtilityView extends GetView<UtilityController> {
  const UtilityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: Text('Utility', style: Styles.normalTextW700(size: 20)),
      ),
      body: Column(
        children: [
          TicketWidget(
            drawArc: false,
            drawShadow: false,
            triangleAxis: Axis.horizontal,
            backgroundColor: Colors.transparent,
            contentBackgroundColor: Styles.green8,
            dividerStrokeWidth: 0.5,
            dividerColor: Styles.green9,
            triangleSize: const Size(12, 6),
            trianglePos: .8,
            child: IntrinsicWidth(
              child: Container(
                constraints: const BoxConstraints(
                  minWidth: 160,
                  minHeight: 56,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Giảm 10.000đ',
                              style:
                                  Styles.mediumTextW500(color: Styles.yellow6),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Đơn từ 1.000.000đ',
                              style: Styles.smallText(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(Icons.check_circle, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
