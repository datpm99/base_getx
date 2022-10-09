import 'package:get/get.dart';

import '/const/import_const.dart';
import '/lang/lang_controller.dart';
import '/routes/routes.dart';
import '/widgets/dialogs/lang_dialog.dart';

class UserController extends GetxController {
  final _lang = Get.find<LangController>();
  RxBool modeLight = true.obs;
  RxString textMode = 'light_mode'.obs;

  void onSignOut() {}

  void onChangeTheme() {
    modeLight.value = !modeLight.value;
    if (modeLight.value) textMode.value = 'light_mode';
    if (!modeLight.value) textMode.value = 'dark_mode';
    Styles.changeTheme();
  }

  void onProfile() => Get.toNamed(Routes.profile);

  void onLanguage() => Get.dialog(LangDialog(onChanged: changeLanguage));

  void changeLanguage(value) {
    if (value == 'vi') {
      _lang.changeLang('vi', 'VN');
    } else {
      _lang.changeLang('en', 'US');
    }
    Get.back();
  }

  void onSignIn() => Get.offNamed(Routes.signIn);

  void onSignUp() => Get.offNamed(Routes.signUp);

  void onOtp() => Get.toNamed(Routes.otp);
}
