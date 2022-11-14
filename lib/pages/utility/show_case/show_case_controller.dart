import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

import 'email_model.dart';

class ShowcaseController extends GetxController {
  late BuildContext myContext;
  final one = GlobalKey();
  final two = GlobalKey();
  final three = GlobalKey();
  final four = GlobalKey();

  List<EmailModel> lstEmail = [
    EmailModel(
      sender: 'Medium',
      sub: 'Showcase View',
      msg: 'Check new showcase View',
      date: '1 May',
      isUnread: false,
    ),
    EmailModel(
      sender: 'Quora',
      sub: 'New Question for you',
      msg: 'Hi, There is new question for you',
      date: '2 May',
      isUnread: true,
    ),
    EmailModel(
      sender: 'Google',
      sub: 'Flutter 1.5',
      msg: 'We have launched Flutter 1.5',
      date: '3 May',
      isUnread: false,
    ),
    EmailModel(
      sender: 'Github',
      sub: 'Showcase View',
      msg: 'New star on your showcase view.',
      date: '4 May ',
      isUnread: true,
    ),
    EmailModel(
      sender: 'Simform',
      sub: 'Credit card Plugin',
      msg: 'Check out our credit card plugin',
      date: '5 May',
      isUnread: false,
    ),
    EmailModel(
      sender: 'Flutter',
      sub: 'Flutter is Future',
      msg: 'Flutter launched for Web',
      date: '6 May',
      isUnread: true,
    ),
    EmailModel(
      sender: 'Medium',
      sub: 'Showcase View',
      msg: 'Check new showcase View',
      date: '7 May ',
      isUnread: false,
    ),
    EmailModel(
      sender: 'Simform',
      sub: 'Credit card Plugin',
      msg: 'Check out our credit card plugin',
      date: '8 May',
      isUnread: true,
    ),
    EmailModel(
      sender: 'Flutter',
      sub: 'Flutter is Future',
      msg: 'Flutter launched for Web',
      date: '9 May',
      isUnread: false,
    ),
  ];

  void onShowCase() {
    ShowCaseWidget.of(myContext)!.startShowCase([one, two, three, four]);
  }

  @override
  void onReady() {
    super.onReady();
    onShowCase();
  }
}
