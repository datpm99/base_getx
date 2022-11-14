import 'package:get/get.dart';
import 'bottom_sheet_controller.dart';

class BottomSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomSheetController());
  }
}
