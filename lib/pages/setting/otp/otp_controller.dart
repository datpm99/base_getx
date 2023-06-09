import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/setting/otp/models/requests/otp_request.dart';

class OtpController extends GetxController {
  String phone = '0979560184';
  final pin1Controller = TextEditingController();
  final pin2Controller = TextEditingController();
  final pin3Controller = TextEditingController();
  final pin4Controller = TextEditingController();
  final pin5Controller = TextEditingController();
  final pin6Controller = TextEditingController();

  final pin1FocusNode = FocusNode();
  final pin2FocusNode = FocusNode();
  final pin3FocusNode = FocusNode();
  final pin4FocusNode = FocusNode();
  final pin5FocusNode = FocusNode();
  final pin6FocusNode = FocusNode();

  //Count down time.
  Timer? _timer;
  int countDown = 60;
  String msgErrOtp = '';
  String msgErrForm = '';

  bool stateCountDown = true;
  bool stateActiveBtn = true;
  bool stateActiveResend = false;

  @override
  void onReady() {
    super.onReady();
    countDown = AppConfigs.timeOTP;
    countDownTime();
  }

  _activeState(bool isActive) {
    if (isActive) {
      stateCountDown = true;
      stateActiveBtn = true;
      stateActiveResend = false;
    } else {
      stateCountDown = false;
      stateActiveBtn = false;
      stateActiveResend = true;
    }
  }

  void countDownTime() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countDown > 0) {
        countDown--;
        _activeState(true);
        update();
      } else {
        _activeState(false);
        _timer!.cancel();
        update();
      }
    });
  }

  void resetCountDown() {
    if (_timer.isNull) _timer!.cancel();
    msgErrForm = '';
    _activeState(true);
    countDown = AppConfigs.timeOTP;
    pin1FocusNode.requestFocus();
    _resetPinOtp();
    update();
  }

  ///Validate OTP.
  String validatePin() {
    if (pin1Controller.text.isEmpty ||
        pin2Controller.text.isEmpty ||
        pin3Controller.text.isEmpty ||
        pin4Controller.text.isEmpty ||
        pin5Controller.text.isEmpty ||
        pin6Controller.text.isEmpty) {
      return 'msg_error.incorrect'.trParams({'label': 'verification'.tr});
    }
    return '';
  }

  void verifyOtp() {
    // if (!stateActiveBtn) return;
    // String validator = validatePin();
    // if (validator.isNotEmpty) {
    //   msgErrForm = validator;
    //   update();
    //   return;
    // }
    //_verifyOtp();
    Get.back();
  }

  void _verifyOtp() async {
    AppUtils.showLoader();
    OtpRequest request = OtpRequest(
      phone: 'phone',
      password: 'password',
      otp: 'otp',
    );
/*    var result = await _service.otpVerify(request);
    await AppUtils.hideLoading();
    if (result != null && result.status == StatusCode.ok) {
      //TODO: OTP success to do something.
    } else if (result != null &&
        result.status != StatusCode.ok &&
        result.payload.message.isNotEmpty) {
      Get.dialog(ErrorDialog(content: result.payload.message));
    } else {
      Get.dialog(ErrorDialog(content: 'msg_error_have_error'.tr));
    }*/
  }

  ///RESENT OTP.
  void onResentOtp() {
    // if (!stateCountDown) _resentOtp();
  }

  void _resentOtp() async {
    AppUtils.showLoader();
    // var result = await _service.resendOtp(phone);
    // await AppUtils.hideLoading();
    // if (result != null && result.status == StatusCode.ok) {
    //   resetCountDown();
    //   countDownTime();
    // } else if (result != null &&
    //     result.status != StatusCode.ok &&
    //     result.payload.message.isNotEmpty) {
    //   Get.dialog(ErrorDialog(content: result.payload.message));
    // } else {
    //   Get.dialog(ErrorDialog(content: 'msg_error_have_error'.tr));
    // }
  }

  String _getPinOtp() {
    return '${pin1Controller.text}${pin2Controller.text}${pin3Controller.text}${pin4Controller.text}${pin5Controller.text}${pin6Controller.text}';
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) focusNode.requestFocus();
  }

  void _resetPinOtp() {
    pin1Controller.clear();
    pin2Controller.clear();
    pin3Controller.clear();
    pin4Controller.clear();
    pin5Controller.clear();
    pin6Controller.clear();
  }

  @override
  void onClose() {
    //FocusNode.
    pin1FocusNode.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
    //Controller.
    pin1Controller.dispose();
    pin2Controller.dispose();
    pin3Controller.dispose();
    pin4Controller.dispose();
    pin5Controller.dispose();
    pin6Controller.dispose();
    //Timer.
    if (!_timer.isBlank!) _timer!.cancel();
    super.onClose();
  }
}
