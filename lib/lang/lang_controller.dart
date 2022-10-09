import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/services/storage/storage_service.dart';

class LangController extends GetxController {
  final _storage = Get.find<StorageService>();
  Locale locale = const Locale('vi', 'VN');

  @override
  void onInit() {
    super.onInit();
    var loc = _storage.language.split('_');
    locale = Locale(loc[0], loc[1]);
  }

  Future<void> changeLang(String l1, String l2) async {
    locale = Locale(l1, l2);
    _storage.language = l1 + '_' + l2;
    Get.updateLocale(Locale(l1, l2));
  }
}
