import 'package:base_getx/widgets/tooltip/cus_tooltip.dart';
import 'package:flutter/material.dart';

import '/const/import_const.dart';
import '/widgets/ticket_widget.dart';

class PaintView extends StatelessWidget {
  const PaintView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Paint', style: Styles.normalTextW700(size: 20)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(),
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
                                style: Styles.mediumTextW500(
                                    color: Styles.yellow6),
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

            //
            CusTooltip(
              content: 'This is custom tooltip',
              widget: Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Styles.primaryColor),
                ),
                child: const Text('CusTooltip'),
              ),
            ).pOnly(top: 20),
          ],
        ),
      ),
    );
  }
}
