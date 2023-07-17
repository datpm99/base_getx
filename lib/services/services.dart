import 'package:get/get.dart';
import '/lang/lang_controller.dart';
import 'api/base_api.dart';
import 'storage/storage_service.dart';

class AppServices {
  static Future<void> init() async {
    await Get.put(StorageService()).init();
    await Get.put(BaseApi()).init();
    Get.put(LangController());
  }
}

abstract class BaseService {
  Future<void> init() async {}
}
