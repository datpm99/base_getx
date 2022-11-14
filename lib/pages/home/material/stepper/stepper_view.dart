import 'package:flutter/material.dart';
import '/const/import_const.dart';
import 'package:get/get.dart';

import 'stepper_controller.dart';

class StepperView extends StatelessWidget {
  const StepperView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Stepper', style: Styles.normalTextW700(size: 20)),
      ),
      body: GetBuilder<StepperController>(builder: (c) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 360,
                child: Stepper(
                  type: StepperType.horizontal,
                  currentStep: c.currentStep,
                  elevation: 0,
                  // controlsBuilder: (BuildContext context, {VoidCallback? onStepContinue, VoidCallback? onStepCancel}) {
                  //   return Row(
                  //     mainAxisSize: MainAxisSize.max,
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: <Widget>[
                  //       TextButton(
                  //         onPressed: onStepContinue,
                  //         child: Text('CONTINUE', style: secondaryTextStyle()),
                  //       ),
                  //       10.width,
                  //       TextButton(
                  //         onPressed: onStepCancel,
                  //         child: Text('CANCEL', style: secondaryTextStyle()),
                  //       ),
                  //     ],
                  //   );
                  // },
                  onStepContinue: c.onStepContinue,
                  onStepCancel: c.onStepCancel,
                  onStepTapped: c.onStepTapped,
                  steps: [
                    Step(
                      title: const Text("Account"),
                      isActive: (c.currentStep == 0),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Account Information",
                            style: Styles.mediumTextW700(),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter Email Id',
                              icon: Icon(Icons.email),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Username',
                              hintText: 'Enter UserName',
                              icon: Icon(Icons.person),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                              hintText: 'Enter Password',
                              icon: Icon(Icons.lock),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Step(
                      title: const Text("Personal"),
                      isActive: (c.currentStep == 1),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal Information",
                            style: Styles.mediumTextW700(),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'First Name',
                              hintText: 'Enter First Name',
                              icon: Icon(Icons.person),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Last Name',
                              hintText: 'Enter Last Name',
                              icon: Icon(Icons.person),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 1),

              //Stepper 2.
              Theme(
                data: ThemeData(backgroundColor: Colors.white),
                child: SizedBox(
                  height: 600,
                  child: Stepper(
                    type: StepperType.vertical,
                    currentStep: c.currentStep2,
                    onStepContinue: c.onStepContinue2,
                    onStepCancel: c.onStepCancel2,
                    onStepTapped: c.onStepTapped2,
                    steps: [
                      Step(
                        isActive: c.currentStep2 == 0,
                        title: const Text("Contact Detail"),
                        subtitle: const Text("Add Contact Detail"),
                        content: const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        ),
                      ),
                      Step(
                        isActive: c.currentStep2 == 1,
                        title: const Text("Shipping Information"),
                        subtitle: const Text("Add Shipping Information"),
                        content: const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        ),
                      ),
                      Step(
                        isActive: c.currentStep2 == 2,
                        title: const Text("Billing Address"),
                        subtitle: const Text("Added Billing Address"),
                        content: const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        ),
                      ),
                      Step(
                        isActive: c.currentStep2 == 3,
                        title: const Text("Payment Flow"),
                        subtitle: const Text("Select Payment method"),
                        content: const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
