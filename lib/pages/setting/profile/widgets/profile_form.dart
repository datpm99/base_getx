import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/pages/setting/profile/profile_controller.dart';
import '/widgets/get_input_text.dart';
import 'field_dob.dart';
import 'profile_gender.dart';

class ProfileForm extends GetView<ProfileController> {
  const ProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('full_name'.tr, style: Styles.normalTextW700()).pOnly(bottom: 5),
        GetInputText(config: controller.fullName),

        //Date of birth.
        Text('dob'.tr, style: Styles.normalTextW700()).pOnly(bottom: 5),
        const FieldDob(),

        //Gender.
        Text('gender'.tr, style: Styles.normalTextW700()).pOnly(bottom: 5),
        const ProfileGender().pOnly(bottom: 15),

        //Email.
        Text('Email', style: Styles.normalTextW700()).pOnly(bottom: 5),
        GetInputText(config: controller.email),

        //Address.
        Text('address'.tr, style: Styles.normalTextW700()).pOnly(bottom: 5),
        GetInputText(config: controller.address),
      ],
    );
  }
}
