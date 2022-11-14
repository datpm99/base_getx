import 'package:get/get.dart';

import '/const/import_const.dart';
import '/models/obj_model.dart';
import 'widgets/bottom_sheet_1.dart';
import 'widgets/bottom_sheet_2.dart';
import 'widgets/bottom_sheet_3.dart';
import 'widgets/bottom_sheet_4.dart';

class BottomSheetController extends GetxController {
  List<ObjModel> lstBottomSheet = [
    ObjModel(
      title: 'Bottom Sheet 1',
      subTitle: 'This is bottom sheet 1',
      color: Styles.purple4,
      route: 'sheet1',
    ),
    ObjModel(
      title: 'Bottom Sheet 2',
      subTitle: 'This is bottom sheet 2',
      color: Styles.pink2,
      route: 'sheet2',
    ),
    ObjModel(
      title: 'Bottom Sheet 3',
      subTitle: 'This is bottom sheet 3',
      color: Styles.green3,
      route: 'sheet3',
    ),
    ObjModel(
      title: 'Bottom Sheet 4',
      subTitle: 'This is bottom sheet 4',
      color: Styles.purple4,
      route: 'sheet4',
    ),
  ];

  List<ObjModel> lstItemSheet3 = [
    ObjModel(
      title: 'Transfer',
      color: Styles.green4,
      image: 'assets/icons/t5_paperplane.svg'
    ),
    ObjModel(
        title: 'Wallet',
        color: Styles.purple7,
        image: 'assets/icons/t5_wallet.svg'
    ),
    ObjModel(
        title: 'Voucher',
        color: Styles.red7,
        image: 'assets/icons/t5_coupon.svg'
    ),
    ObjModel(
        title: 'Pay Bill',
        color: Styles.yellow3,
        image: 'assets/icons/t5_invoice.svg'
    ),
    ObjModel(
        title: 'Exchange',
        color: Styles.green5,
        image: 'assets/icons/t5_dollar_exchange.svg'
    ),
    ObjModel(
        title: 'Services',
        color: Styles.blue9,
        image: 'assets/icons/t5_circle.svg'
    ),
    ObjModel(
        title: 'Crypto',
        color: Styles.red7,
        image: 'assets/icons/t5_invoice.svg'
    ),
    ObjModel(
        title: 'Mobile',
        color: Styles.green5,
        image: 'assets/icons/t5_dollar_exchange.svg'
    ),
    ObjModel(
        title: 'Services',
        color: Styles.blue9,
        image: 'assets/icons/t5_circle.svg'
    ),
  ];

  void showBottomSheet(String route) {
    switch (route) {
      case 'sheet1':
        Get.bottomSheet(const BottomSheet1());
        break;
      case 'sheet2':
        Get.bottomSheet(const BottomSheet2());
        break;
      case 'sheet3':
        Get.bottomSheet(const BottomSheet3());
        break;
      case 'sheet4':
        Get.bottomSheet(const BottomSheet4(), isScrollControlled: true);
        break;
    }
  }
}
