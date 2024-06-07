import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '/const/common_export.dart';
import '/lang/lang_controller.dart';
import '/routes/routes.dart';
import '/widget/loaders.dart';

class AppUtils {
  static final lang = Get.find<LangController>();
  static final storage = Get.find<StorageService>();
  static final logger = Logger();
  static final loggerNoStack = Logger(printer: PrettyPrinter(methodCount: 0));

  /// System.
  static Future<void> hideLoader() async {
    if (Get.isDialogOpen!) Get.back();
  }

  static Future<void> showLoader() async {
    Get.dialog(
      const Center(child: LoaderCircular()),
      barrierDismissible: false,
    );
  }

  static void showLogDebug(String msg) {
    loggerNoStack.d(msg);
  }

  static void showLogInfo(String msg) {
    loggerNoStack.d(msg);
  }

  static void showLogWarning(String msg) {
    loggerNoStack.w(msg);
  }

  static void showLogError(String msg) {
    logger.e(msg);
  }

  static void showError(String message, {bool isClose = true}) {
    if (Get.isDialogOpen! && isClose) Get.back();
    Get.snackbar(
      'error'.tr,
      message,
      borderWidth: 0,
      borderRadius: 8,
      overlayBlur: .1,
      overlayColor: Colors.black26,
      backgroundColor: Colors.white,
      animationDuration: 0.45.seconds,
      reverseAnimationCurve: Curves.easeOutExpo,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      maxWidth: Get.width - 32,
      titleText: const SizedBox.shrink(),
      boxShadows: Styles.boxShadow3(),
      messageText: Row(
        children: [
          SvgPicture.asset('assets/icons/ic_error.svg'),
          const SizedBox(width: 8),
          Text(message, style: Styles.normalText(color: Styles.red6)).expand(),
          GestureDetector(
            onTap: Get.back,
            child: const Icon(Icons.close, color: Styles.grey26, size: 20),
          ),
        ],
      ).pOnly(bottom: 6),
    );
  }

  static void showSuccess(String message, {bool isClose = true}) {
    if (Get.isDialogOpen! && isClose) Get.back();
    Get.snackbar(
      'success'.tr,
      message,
      borderWidth: 0,
      borderRadius: 4,
      backgroundColor: Styles.green10,
      animationDuration: 0.45.seconds,
      overlayBlur: .1,
      overlayColor: Colors.black26,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.easeOutExpo,
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.zero,
      maxWidth: Get.width - 32,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      titleText: const SizedBox.shrink(),
      messageText: Row(
        children: [
          SvgPicture.asset('assets/icons/ic_check_circle.svg'),
          const SizedBox(width: 8),
          Text(message, style: Styles.normalTextW500(color: Colors.white))
              .expand(),
        ],
      ).pOnly(bottom: 6),
    );
  }

  static String getPlatForm() {
    if (GetPlatform.isAndroid) return 'ANDROID';
    if (GetPlatform.isIOS) return 'IOS';
    return 'WEB';
  }

  /// Authentication.
  // static void setTokenAndTimeOut(LoginModel model) {
  //   //DateTime expirationDate = JwtDecoder.getExpirationDate(model.accessToken);
  //   DateTime expirationDate = DateTime.now().add(const Duration(minutes: 150));
  //
  //   storage.accessToken = model.accessToken;
  //   storage.refreshToken = model.refreshToken;
  //   storage.tokenTimeout = expirationDate.toString();
  // }

  static bool validateTokenTimeout() {
    if (storage.tokenTimeout.isEmpty) return false;
    DateTime now = DateTime.now().add(const Duration(minutes: 3));

    //Check current time <= timeout return false
    DateTime? timeOut = DateTime.tryParse(storage.tokenTimeout);
    return timeOut!.isAfter(now);
  }

  static void logout({bool showMess = false}) async {
    if (Get.isDialogOpen!) Get.back();
    //if (storage.accessToken.isEmpty) return;
    storage.accessToken = '';
    storage.refreshToken = '';
    storage.tokenTimeout = '';
    Get.offAllNamed(Routes.signIn);

    Future.delayed(const Duration(seconds: 1), () {
      if (showMess && !Get.isDialogOpen!) showError('msg_session_timeout');
    });
  }

  /// File.
  static Future<File> writeFile(Uint8List data) async {
    Directory tempDir = await getTemporaryDirectory();
    var filePath = '${tempDir.path}/file_01.png';
    return File(filePath).writeAsBytes(data);
  }

  static Future<String> writeFile2(String dataPdf, int id) async {
    Directory tempDir = await getTemporaryDirectory();
    var filePath = '${tempDir.path}/file_$id.pdf';
    Uint8List bytes = base64.decode(dataPdf);
    File filePdf = await File(filePath).writeAsBytes(bytes);
    return filePdf.path;
  }

  static String getFileSize(int fileSize, {int round = 0}) {
    if (fileSize <= 0) return "0B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(fileSize) / log(1024)).floor();
    return ((fileSize / pow(1024, i)).toStringAsFixed(round)) + suffixes[i];
  }

  /// Color selectBox.
  static Color getColorBgSelectedItem(int id, var item) {
    if (item.id == id) return Styles.blue8;
    return Colors.white;
  }

  static Color getColorTextSelectedItem(int id, var item) {
    if (item.id == id) return Styles.blue7;
    return Styles.black2;
  }

  /// Format by 0979560***.
  static String maskPhone(String phone) {
    if (phone.isEmpty) return '';
    if (phone.length > 6) phone = '${phone.substring(0, 7)}***';
    return phone;
  }

  /// Utils.
  static String getFirstCharacter(String name) {
    if (name.isEmpty) return '';
    name = name.trim();
    String lastWord = name.substring(name.lastIndexOf(" ") + 1);
    return lastWord[0].toUpperCase();
  }
}
