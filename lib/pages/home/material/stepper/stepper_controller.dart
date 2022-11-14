import 'package:get/get.dart';

class StepperController extends GetxController {
  int currentStep = 0;

  void onStepContinue() {
    if (currentStep < 1) currentStep++;
    update();
  }

  void onStepCancel() {
    if (currentStep > 0) currentStep--;
    update();
  }

  void onStepTapped(int step) {
    currentStep = step;
    update();
  }

  int currentStep2 = 0;

  void onStepContinue2() {
    if (currentStep2 < 3) currentStep2++;
    update();
  }

  void onStepCancel2() {
    if (currentStep2 > 0) currentStep2--;
    update();
  }

  void onStepTapped2(int step) {
    currentStep2 = step;
    update();
  }
}
