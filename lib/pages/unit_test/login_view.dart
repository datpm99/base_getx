import 'package:base_getx/utils/adaptive_page.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget with AdaptivePage{
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: adaptiveBody(context),
    );
  }

  @override
  Widget mobileLandscapeBody(BuildContext context, Size size) {
    // TODO: implement mobileLandscapeBody
    throw UnimplementedError();
  }

  @override
  Widget mobilePortraitBody(BuildContext context, Size size) {
    // TODO: implement mobilePortraitBody
    throw UnimplementedError();
  }

  @override
  Widget tabletLandscapeBody(BuildContext context, Size size) {
    // TODO: implement tabletLandscapeBody
    throw UnimplementedError();
  }

  @override
  Widget tabletPortraitBody(BuildContext context, Size size) {
    // TODO: implement tabletPortraitBody
    throw UnimplementedError();
  }
}
