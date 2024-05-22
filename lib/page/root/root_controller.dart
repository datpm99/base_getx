import 'package:get/get.dart';
import '/widget/dialogs/exit_dialog.dart';
import 'models/nav_data.dart';

class RootController extends GetxController {
  List<NavItemData> lstNav = [];
  RxInt selectedNav = 2.obs;

  @override
  void onInit() {
    super.onInit();
    lstNav = NavData().myData;
  }

  void onTapNav(int idx) async {
    selectedNav(idx);
  }

  Future<bool> canPop() async {
    final result = await Get.dialog(const ExitDialog());
    if (result != null && result) {
      // if (GetPlatform.isAndroid) SystemNavigator.pop();
      // if (GetPlatform.isIOS) exit(0);
      return true;
    }
    return false;
  }
}
