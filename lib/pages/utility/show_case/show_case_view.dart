import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:showcaseview/showcaseview.dart';

import '/const/import_const.dart';
import 'email_model.dart';
import 'show_case_controller.dart';

class ShowCaseView extends GetView<ShowcaseController> {
  const ShowCaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(builder: (context) {
        controller.myContext = context;
        return Scaffold(
          body: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Header.
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(left: 10, right: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xffF9F9F9),
                        border: Border.all(color: Styles.grey25, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: <Widget>[
                          Showcase(
                            key: controller.one,
                            description: 'Tap to see menu options',
                            child: const Icon(Icons.menu,
                                color: Colors.pinkAccent),
                          ),
                          const SizedBox(width: 10),
                          Text('Search email', style: Styles.mediumText()),
                          const Spacer(),
                          const Icon(Icons.search, color: Colors.grey),
                        ],
                      ),
                    ).expand(),
                    Showcase(
                      key: controller.two,
                      title: 'Profile',
                      description:
                          "Tap to see profile which contains user's name, profile picture, mobile number and country",
                      showcaseBackgroundColor: Colors.pinkAccent,
                      textColor: Colors.white,
                      shapeBorder: const CircleBorder(),
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pinkAccent,
                        ),
                        child: const Icon(Icons.star),
                      ),
                    ),
                    const SizedBox(width: 12)
                  ],
                ).pOnly(top: 20, bottom: 14),

                //List.
                Text('PRIMARY', style: Styles.mediumTextW700()).pOnly(left: 16),
                const Padding(padding: EdgeInsets.only(top: 8)),
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.lstEmail.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Showcase(
                        key: controller.three,
                        description: "Tap to check mail",
                        child: MailTile(model: controller.lstEmail[index]),
                      );
                    }
                    return MailTile(model: controller.lstEmail[index]);
                  },
                ).expand(),
              ],
            ),
          ),
          floatingActionButton: Showcase(
            key: controller.four,
            title: 'Compose Mail',
            description: 'Click here to compose mail',
            shapeBorder: const CircleBorder(),
            child: FloatingActionButton(
              backgroundColor: Colors.pinkAccent,
              onPressed: controller.onShowCase,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        );
      }),
    );
  }
}

class MailTile extends StatelessWidget {
  const MailTile({required this.model, Key? key}) : super(key: key);
  final EmailModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6, right: 16, top: 8, bottom: 8),
      color: model.isUnread ? Styles.pink3 : Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Styles.pink4,
                ),
                child: Text(
                  'S',
                  style: Styles.mediumTextW700(color: Colors.pinkAccent),
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.sender,
                    style: TextStyle(
                      fontWeight:
                          model.isUnread ? FontWeight.bold : FontWeight.normal,
                      fontSize: 17,
                    ),
                  ),
                  Text(model.sub, style: Styles.mediumText()),
                  Text(
                    model.msg,
                    style: TextStyle(
                      color: model.isUnread ? Colors.pinkAccent : Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ],
              ).expand()
            ],
          ).expand(),
          SizedBox(
            width: 50,
            child: Column(
              children: <Widget>[
                Text(
                  model.date,
                  style: Styles.smallText(color: Colors.grey),
                ).pOnly(top: 5, bottom: 10),
                Icon(
                  model.isUnread ? Icons.star : Icons.star_border,
                  color: model.isUnread ? Styles.yellow5 : Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
