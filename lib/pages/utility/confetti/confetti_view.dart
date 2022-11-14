import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '/const/import_const.dart';
import '/widgets/buttons/default_button.dart';
import 'confetti_controller.dart';

class ConfettiView extends GetView<ConfettiGetController> {
  const ConfettiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text('Confetti', style: Styles.normalTextW700(size: 20)),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Lottie.asset('assets/jsons/confitte.json'),
              Text(
                'Congratulations !!',
                style: Styles.normalTextW700(size: 30),
              ).pOnly(bottom: 20),
              DefaultButton(
                radius: 8,
                text: 'Confetti',
                onTap: controller.onPlayConfettiCenter,
              ),
            ],
          ),
          Container(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              confettiController: controller.controllerCenter,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
              emissionFrequency: 0.1,
              canvas: Size.fromRadius(MediaQuery.of(context).size.height * .35),
              createParticlePath: controller.drawStar,
              colors: const [
                Colors.green,
                Colors.blue,
                Colors.pink,
                Colors.orange,
                Colors.purple
              ], // manually specify the colors to be used
            ),
          ),
        ],
      ),
    );
  }
}
