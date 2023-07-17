import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/import_const.dart';
import '/widgets/divider_form.dart';
import '/widgets/images/cus_image_icon.dart';
import 'sign_in_controller.dart';
import 'widgets/no_account_text.dart';
import 'widgets/sign_in_form.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

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
                'sign_in'.tr.toUpperCase(),
                style: Styles.normalTextW700(size: 24),
              ),
              const SizedBox(height: 30),
              const SignInForm(),
              const DividerForm().py(30),
              const NoAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
