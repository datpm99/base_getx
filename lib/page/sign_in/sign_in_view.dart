import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/const/theme/styles.dart';
import 'sign_in_controller.dart';
import 'widgets/sign_in_form.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset('assets/images/logo.png', height: 150),
              const SizedBox(height: 30),
              Text(
                'sign_in'.tr.toUpperCase(),
                style: Styles.normalTextW700(size: 24),
              ),
              const SizedBox(height: 30),
              const SignInForm(),
            ],
          ),
        ),
      ),
    );
  }
}
