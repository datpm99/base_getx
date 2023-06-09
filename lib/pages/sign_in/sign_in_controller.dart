import 'package:get/get.dart';

import '/const/import_const.dart';
import '/routes/routes.dart';
import '/widgets/get_input_text.dart';
import 'models/requests/sign_in_request.dart';
import 'sign_in_fields.dart';

class SignInController extends GetxController {
  final _storage = Get.find<StorageService>();
  final _fields = SignInFields();

  GetInputTextConfig get phone => _fields.phone;

  GetInputTextConfig get password => _fields.password;

  void onSignIn() {
    bool isPhone = phone.validate();
    bool isPassword = password.validate();
    if (isPhone && isPassword) {
      _login();
    }
  }

  Future<void> _login() async {
    AppUtils.showLoader();
    SignInRequest request = SignInRequest(
      phone: _fields.phone.value.trim(),
      password: _fields.password.value,
      deviceId: _storage.deviceID,
    );

    _storage.authModel = request.toJson();
    await 1.delay();
    AppUtils.hideLoader();

    //Set data.
    DateTime tokenTimeout = DateTime.now().add(const Duration(minutes: 60));
    _storage.tokenTimeout = tokenTimeout.toString();
    Get.offAllNamed(Routes.root);
  }

  @override
  void onReady() {
    super.onReady();
    phone.value = '0987654321';
    password.value = '123456';
  }
}
