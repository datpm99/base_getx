import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/widgets/divider_form.dart';
import '/widgets/images/cus_image_icon.dart';
import 'sign_up_controller.dart';
import 'widgets/sign_up_footer.dart';
import 'widgets/sign_up_form.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const CusImageIcon(asset: 'assets/images/logo.png', size: 200),
              Text(
                'sign_up'.tr.toUpperCase(),
                style: Styles.normalTextW700(size: 24, color: Colors.grey),
              ),
              const SizedBox(height: 50),
              const SignUpForm(),
              const DividerForm().py(30),
              const SignUpFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
