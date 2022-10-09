import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';

class LangDialog extends StatelessWidget {
  const LangDialog({Key? key, required this.onChanged}) : super(key: key);
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: Styles.borderDialog(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Title.
          Text('language'.tr, style: Styles.mediumTextW700())
              .pOnly(bottom: 15.h),

          //Lang vi.
          GestureDetector(
            onTap: () => onChanged('vi'),
            child: Row(
              children: [
                Image.asset('assets/icons/ic_flag_vn.png',
                    width: 45.w, height: 32.h),
                SizedBox(width: 20.w),
                Text('lang_vi'.tr, style: Styles.smallTextW700()),
              ],
            ),
          ),

          //Lang en.
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => onChanged('en'),
            child: Row(
              children: [
                Image.asset('assets/icons/ic_flag_us.png',
                    width: 45.w, height: 32.h),
                SizedBox(width: 20.w),
                Text('lang_us'.tr, style: Styles.smallTextW700()),
              ],
            ),
          ),
        ],
      ).p(15),
    );
  }
}
