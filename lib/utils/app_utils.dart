import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '/const/import_const.dart';
import '/lang/lang_controller.dart';
import '/routes/routes.dart';
import '/widgets/images/cus_image_icon.dart';
import '/widgets/loaders.dart';

class AppUtils {
  static final lang = Get.find<LangController>();
  static bool isShowLoading = false;

  static Future<void> hideLoader() async {
    if (!isShowLoading) return;
    isShowLoading = false;
    if (!Get.isSnackbarOpen) Get.back();
  }

  static Future<void> showLoader() async {
    Get.dialog(
      const Center(child: LoaderCircular()),
      barrierDismissible: false,
    );
  }

  static void showError(String message) {
    if (isShowLoading && Get.isDialogOpen!) {
      hideLoader();
    }
    Get.snackbar(
      'error'.tr,
      message,
      borderRadius: 0,
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

  static void showSuccess(String message) {
    if (isShowLoading && Get.isDialogOpen!) {
      hideLoader();
    }
    Get.snackbar(
      'success'.tr,
      message,
      borderRadius: 0,
      colorText: Styles.black1,
      backgroundColor: Styles.green1,
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

  static bool validateSessionTimeout() {
    final _storage = Get.find<StorageService>();
    String sessionTimeout = _storage.sessionTimeout;
    DateTime now = DateTime.now();
    if (sessionTimeout.isEmpty) return false;

    //Check current time <= timeout return false
    DateTime? timeOut = DateTime.tryParse(sessionTimeout);
    var diff = now.difference(timeOut!).inMinutes;
    if (diff >= 0) {
      _storage.sessionTimeout = '';
      return false;
    }

    //Update sessionTimeout.
    // _storage.sessionTimeout = now.add(const Duration(minutes: 30)).toString();
    return true;
  }

  static void logout() async {
    final _storage = Get.find<StorageService>();
    String routesLogout = Routes.signIn;

    _storage.sessionTimeout = '';
    _storage.apiToken = '';
    _storage.userInfo = '';
    Get.offAllNamed(routesLogout);
  }

  static Future<DateTime?> datePicker(BuildContext context,
      {required DateTime initDate, required String errorFormatText}) async {
    final DateTime? picked = await showDatePicker(
      locale: lang.locale,
      context: context,
      initialDate: initDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
      errorFormatText: errorFormatText,
    );
    return picked;
  }

  ///Format date.
  static String formatDate1(String val) {
    if (val.isEmpty) return '';
    final dateFormat = DateFormat("dd/MM/yyyy HH:mm:ss");
    final dateTime = dateFormat.parse(val);
    return dateFormat.format(dateTime);
  }

  static String formatDate2(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  static String formatDate3(String val) {
    if (val.isEmpty) return '';
    final dateFormat = DateFormat("dd/MM/yyyy HH:mm:ss");
    final date = dateFormat.parse(val);
    return DateFormat("HH:mm:ss dd/MM/yyyy").format(date);
  }

  ///Write file.
  static Future<File> writeFileImg(var data) async {
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

  static bool checkFormatImage(String path) {
    String image = path.split('.').last;
    return (image == 'png' || image == 'jpg');
  }

  static Future<void> closeNotify() async {
    await 2.5.delay();
    Get.back();
  }

  static String getFirstCharacter(String name) {
    if (name.isEmpty) return '';
    String lastWord = name.substring(name.lastIndexOf(" ") + 1);
    return lastWord[0].toUpperCase();
  }

  static String getPlatForm() {
    if (GetPlatform.isAndroid) return 'ANDROID';
    if (GetPlatform.isIOS) return 'IOS';
    return 'WEB';
  }

  ///Error api.
  static void showErrorApi(var result, String nameFunc) {
    if (result != null && result.error.isNotEmpty) {
      AppUtils.showError(result.error);
      return;
    }

    debugPrint('error ---> $nameFunc');
    AppUtils.showError('msg_have_error'.tr);
  }

  static void showMessApi(var result, String nameFunc) {
    if (result != null && result.message.isNotEmpty) {
      AppUtils.showError(result.message);
      return;
    }

    debugPrint('error ---> $nameFunc');
    AppUtils.showError('msg_have_error'.tr);
  }

  ///Color selectBox.
  static Color getColorBgSelectedItem(int id, var item) {
    if (item.id == id) return Styles.blue8;
    return Colors.white;
  }

  static Color getColorTextSelectedItem(int id, var item) {
    if (item.id == id) return Styles.blue7;
    return Styles.black2;
  }

  static String getFileSize(int fileSize, {int round = 0}) {
    if (fileSize <= 0) return "0B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(fileSize) / log(1024)).floor();
    return ((fileSize / pow(1024, i)).toStringAsFixed(round)) + suffixes[i];
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
}
