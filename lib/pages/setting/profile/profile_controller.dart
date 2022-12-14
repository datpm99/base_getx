import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '/const/import_const.dart';
import '/lang/lang_controller.dart';
import '/widgets/get_input_text.dart';
import 'models/gender_model.dart';
import 'profile_fields.dart';

class ProfileController extends GetxController {
  final _fields = ProfileFields();
  final lang = Get.find<LangController>();

  GetInputTextConfig get fullName => _fields.fullName;

  GetInputTextConfig get email => _fields.email;

  GetInputTextConfig get address => _fields.address;

  //List Gender.
  List<GenderModel> lstGender = [];
  late GenderModel valueGender;

  void initDataGender() {
    lstGender.add(GenderModel(id: 0, name: 'male'.tr));
    lstGender.add(GenderModel(id: 1, name: 'female'.tr));
    lstGender.add(GenderModel(id: 2, name: 'other'.tr));
    valueGender = lstGender.first;
  }

  void selectedGender(GenderModel model) {
    valueGender = model;
    update();
  }

  //Date of Birth.
  DateTime selectedDate = DateTime.now();
  RxString strDob = 'enter_dob'.tr.obs;
  RxBool isSelectDate = false.obs;

  selectDate(BuildContext context) async {
    final DateTime? picked = await AppUtils.datePicker(context,
        initDate: selectedDate, errorFormatText: '');
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      strDob.value = AppUtils.formatDate2(selectedDate);
      isSelectDate.value = true;
    }
  }

  void updateProfile() async {
    AppUtils.showSuccess('message');
    await 1.delay();
    Get.back();
    await 0.5.delay();
    Get.back();
  }

  ///Image picker.
  late File file;
  RxBool isPicker = false.obs;

  _pickImg(ImageSource imageSource) async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: imageSource);
    if (image != null) {
      file = File(image.path);
      if (file.lengthSync() > AppConfigs.fileSize) {
        isPicker.value = false;
        AppUtils.showError(
          'msg_error_size_file'.trParams({'num': AppConfigs.fileSizeName}),
        );
      } else {
        isPicker.value = true;
        Get.back(); // Back bottomSheet.
      }
    }
  }

  //ImagePicker from camera.
  void onCameraImg() async {
    PermissionStatus statusStorage = await Permission.camera.status;
    if (!statusStorage.isGranted) {
      if (await Permission.camera.request().isGranted) {
        _pickImg(ImageSource.camera);
      }
    } else {
      _pickImg(ImageSource.camera);
    }
  }

  //ImagePicker from store.
  void onUploadImg() async {
    PermissionStatus statusStorage = await Permission.storage.status;
    if (!statusStorage.isGranted) {
      if (await Permission.storage.request().isGranted) {
        _pickImg(ImageSource.gallery);
      }
    } else {
      _pickImg(ImageSource.gallery);
    }
  }

  @override
  void onInit() {
    super.onInit();
    initDataGender();
  }
}
