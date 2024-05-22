import 'package:base_get/const/common_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '/model/obj_model.dart';

class BaseListItem extends StatelessWidget {
  const BaseListItem({
    super.key,
    required this.lstObj,
    required this.onTab,
  });
  final List<ObjModel> lstObj;
  final Function(String) onTab;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: lstObj.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 600),
          child: FadeInAnimation(
            child: GestureDetector(
              onTap: () => onTab(lstObj[index].route),
              child: Container(
                width: double.infinity,
                height: 70,
                padding: const EdgeInsets.only(left: 16, right: 16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: Styles.boxShadow2(),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      lstObj[index].title,
                      style: Styles.mediumTextW700(),
                    ),
                    const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
