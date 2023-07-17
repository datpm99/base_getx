import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

import '/const/import_const.dart';
import '/lang/lang_controller.dart';
import '/routes/routes.dart';
import '/widgets/images/cus_image_icon.dart';
import '/widgets/loaders.dart';

class AppUtils {
  static final lang = Get.find<LangController>();
  static final logger = Logger(printer: PrettyPrinter(lineLength: 100));
  static final loggerNoStack = Logger(printer: PrettyPrinter(methodCount: 0, lineLength: 100));

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

  static void showError(String message, {bool isClose = true}) {
    if (Get.isDialogOpen! && isClose) Get.back();
    Get.snackbar(
      'error'.tr,
      message,
      borderRadius: 0,
      duration: const Duration(seconds: 3),
      colorText: Colors.white,
      backgroundColor: Styles.red1,
      animationDuration: 0.45.seconds,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.easeOutExpo,
      overlayColor: Colors.black26,
      overlayBlur: .1,
      margin: const EdgeInsets.symmetric(vertical: 0),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      padding: EdgeInsets.zero,
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CusImageIcon(asset: 'assets/icons/ic_alert_error.png'),
              const SizedBox(width: 10),
              Text(message, style: Styles.normalTextW600()).expand()
            ],
          ).pSymmetric(h: 22, v: 19),
          Container(height: 3, color: Styles.red2)
        ],
      ),
      titleText: const SizedBox.shrink(),
    );
  }

  static void showSuccess(String message, {bool isClose = true}) {
    if (Get.isDialogOpen! && isClose) Get.back();
    Get.snackbar(
      'success'.tr,
      message,
      borderRadius: 0,
      colorText: Styles.black1,
      backgroundColor: Styles.green1,
      animationDuration: 0.45.seconds,
      duration: const Duration(seconds: 3),
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      reverseAnimationCurve: Curves.easeOutExpo,
      overlayColor: Colors.black26,
      overlayBlur: .1,
      margin: const EdgeInsets.symmetric(vertical: 0),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      padding: EdgeInsets.zero,
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CusImageIcon(asset: 'assets/icons/ic_alert_success.png'),
              const SizedBox(width: 10),
              Text(message, style: Styles.normalTextW600()).expand(),
            ],
          ).pSymmetric(h: 22, v: 19),
          Container(height: 3, color: Styles.green2)
        ],
      ),
      titleText: const SizedBox.shrink(),
    );
  }

  static Future<void> closeNotify() async {
    await 3.7.delay();
    //Get.back();
  }

  static String getPlatForm() {
    if (GetPlatform.isAndroid) return 'ANDROID';
    if (GetPlatform.isIOS) return 'IOS';
    return 'WEB';
  }

  /// Authentication.
  static bool validateTokenTimeout() {
    final _storage = Get.find<StorageService>();
    String tokenTimeout = _storage.tokenTimeout;
    DateTime now = DateTime.now();
    if (tokenTimeout.isEmpty) return false;

    //Check current time <= timeout return false
    DateTime? timeOut = DateTime.tryParse(tokenTimeout);
    return timeOut!.isAfter(now);
  }

  static void logout() async {
    final _storage = Get.find<StorageService>();
    _storage.authModel = '';
    _storage.apiToken = '';
    _storage.tokenTimeout = '';
    Get.offAllNamed(Routes.signIn);
  }

  /// File.
  static Future<File> writeFile(var data) async {
    Directory tempDir = await getTemporaryDirectory();
    var filePath = tempDir.path + '/file_01.png';
    return File(filePath).writeAsBytes(data);
  }

  static Future<String> writeFilePdf(Uint8List dataPdf, int id) async {
    Directory tempDir = await getTemporaryDirectory();
    var filePath = tempDir.path + '/file_$id.pdf';
    File filePdf = await File(filePath).writeAsBytes(dataPdf);
    return filePdf.path;
  }

  static Future<String> writeFilePdfEDoc(String dataPdf, int id) async {
    Directory tempDir = await getTemporaryDirectory();
    var filePath = tempDir.path + '/file_$id.pdf';
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

  /// Image.
  static bool checkFormatImage(String path) {
    String image = path.split('.').last.toLowerCase();
    return (image == 'png' || image == 'jpg');
  }

  /// Utils.
  static String getFirstCharacter(String name) {
    if (name.isEmpty) return '';
    name = name.trim();
    String lastWord = name.substring(name.lastIndexOf(" ") + 1);
    return lastWord[0].toUpperCase();
  }

  static String formatCountDoc(int val) {
    if (val < 100) return '$val';
    return '99+';
  }

  static String shortNameFile(String text) {
    if (text.isEmpty) return '';
    if (!text.contains('-')) return text;
    if (text.length <= 15) return text;
    return text.substring(0, 15) + ' ...';
  }

  /// Error api.
  static void showMessApi(var result, String nameFunc) {
    if (result != null && result.message.isNotEmpty) {
      AppUtils.showError(result.message);
      return;
    }

    if (result == null) {
      debugPrint('error ---> $nameFunc');
      AppUtils.showError('msg_have_error'.tr);
    }
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

  static String rdImg() {
    int rd = Random().nextInt(50);
    if (rd == 0) rd = 1;
    return 'assets/icons/ic_$rd.png';
  }

  /// Logger.
  static void showLogInfo(String msg) {
    loggerNoStack.i(msg);
  }

  static void showLogWarning(String msg) {
    loggerNoStack.w(msg);
  }

  static void showLogError(String msg) {
    logger.e(msg);
  }
}
