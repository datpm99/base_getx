import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '/const/import_const.dart';
import 'tinder_card.dart';
import 'tinder_card_controller.dart';

class TinderCardView extends StatelessWidget {
  const TinderCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('TinderCard', style: Styles.normalTextW700(size: 20)),
      ),
      body: GetBuilder<TinderCardController>(
        builder: (c) {
          if (c.isRefresh) {
            return SizedBox(
              width: Get.width,
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Lottie.asset('assets/jsons/empty.json'),
                  const SizedBox(height: 30),
                  Text('No Data Found', style: Styles.normalText(size: 24)),
                ],
              ),
            );
          }

          return SizedBox(
            height: Get.height,
            child: TinderSwapCard(
              stackNum: 3,
              currentIndex: 1,
              totalNum: c.lstTinder.length,
              // orientation where you want to show the stack
              orientation: AmassOrientation.RIGHT,
              // set the max and min width
              maxWidth: Get.width * .9,
              maxHeight: Get.height * 0.8,
              minWidth: Get.width * 0.8,
              minHeight: Get.height * 0.7,
              cardController: c.controller,
              swipeDown: false,
              swipeUp: false,
              swipeUpdateCallback: (var details, Alignment? align) {
                if (align!.x < 0) {
                  //  Card is LEFT swiping.
                } else if (align.x > 0) {
                  //  Card is RIGHT swiping
                }
              },
              swipeCompleteCallback: (var orientation, int index) {
                if ((index + 1) == c.lstTinder.length) {
                  c.onRefreshData();
                }
              },
              cardBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      image: AssetImage(c.lstTinder[index].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: c.onTriggerLeft,
                            child: Container(
                              height: 65,
                              width: 75,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.clear,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: c.onTriggerRight,
                            child: Container(
                              height: 65,
                              width: 75,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ).pOnly(bottom: 40),
                      Text(
                        c.lstTinder[index].name + ' ${c.lstTinder[index].age}',
                        style: Styles.normalText(size: 20, color: Colors.white),
                      ),
                      Text(
                        c.lstTinder[index].city,
                        style: Styles.normalText(size: 18, color: Colors.white),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: GetBuilder<TinderCardController>(
        builder: (c) {
          if (c.isRefresh) {
            return FloatingActionButton(
              onPressed: c.onRefreshData,
              child: const Icon(Icons.refresh, color: Colors.white),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
