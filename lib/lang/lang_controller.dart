import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/service/storage/storage_service.dart';

class LangController extends GetxController {
  final _storage = Get.find<StorageService>();
  Locale locale = const Locale('vi', 'VN');

  @override
  void onInit() {
    super.onInit();
    var loc = _storage.language.split('_');
    locale = Locale(loc[0], loc[1]);
  }

  Future<void> changeLang(String langCode, String countryCode) async {
    locale = Locale(langCode, countryCode);
    _storage.language = '${langCode}_$countryCode';
    Get.updateLocale(Locale(langCode, countryCode));
  }
}
