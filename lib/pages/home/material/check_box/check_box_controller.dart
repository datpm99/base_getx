import 'package:get/get.dart';

class CheckBoxController extends GetxController {
  RxBool simpleCb = false.obs;

  //
  RxBool cusCb1 = false.obs;
  RxBool cusCb2 = false.obs;
  RxBool cusCb3 = false.obs;

  //
  RxBool cbTile1 = false.obs;
  RxBool cbTile2 = false.obs;
  RxBool cbTile3 = false.obs;

  void onChangedSimpleCb(bool? val) {
    simpleCb.value = val!;
  }

  void onChangedCusCb1(bool? val) {
    cusCb1.value = val!;
  }

  void onChangedCusCb2(bool? val) {
    cusCb2.value = val!;
  }

  void onChangedCusCb3(bool? val) {
    cusCb3.value = val!;
  }

  void onChangedCbTile1(bool? val) {
    cbTile1.value = val!;
  }

  void onChangedCbTile2(bool? val) {
    cbTile2.value = val!;
  }

  void onChangedCbTile3(bool? val) {
    cbTile3.value = val!;
  }
}
