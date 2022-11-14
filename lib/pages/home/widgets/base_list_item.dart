import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '/const/import_const.dart';
import '/models/obj_model.dart';

class BaseListItem extends StatelessWidget {
  const BaseListItem({
    Key? key,
    required this.lstObj,
    required this.onTab,
  }) : super(key: key);
  final List<ObjModel> lstObj;
  final Function(String) onTab;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: lstObj.length,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 600),
          child: FadeInAnimation(
            child: GestureDetector(
              onTap: () => onTab(lstObj[index].route),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 80,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: lstObj[index].color,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.asset(AppUtils.rdImg(), color: Colors.white),
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 80,
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        margin: const EdgeInsets.only(right: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: Styles.boxShadow2(),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              lstObj[index].title,
                              style: Styles.mediumTextW700(),
                            ),
                            Visibility(
                              visible: lstObj[index].subTitle.isNotEmpty,
                              child: Text(
                                lstObj[index].subTitle,
                                style: Styles.normalText(color: Styles.grey23),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: lstObj[index].color,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ).expand(),
                ],
              ).pOnly(bottom: 16),
            ),
          ),
        ),
      ),
    );
  }
}
