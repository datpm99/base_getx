import 'package:get/get.dart';

import '/const/common_export.dart';
import '/lang/lang_controller.dart';
import '/widget/dialogs/lang_dialog.dart';

class SettingController extends GetxController {
  final _lang = Get.find<LangController>();
  RxBool modeLight = true.obs;
  RxString textMode = 'light_mode'.obs;

  void onChangeTheme() {
    modeLight.value = !modeLight.value;
    if (modeLight.value) textMode.value = 'light_mode';
    if (!modeLight.value) textMode.value = 'dark_mode';
    Styles.changeTheme();
  }

  void onLanguage() {
    Get.dialog(const LanguagesDialog());
  }
}
