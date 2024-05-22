import 'package:get/get.dart';
import '/page/pages.dart';

class Routes {
  static const root = '/';
  static const signIn = '/signIn';
  static const walkThrough = '/walkThrough';

  static const beforeAfterImg = '/beforeAfterImg';
  static const unitTest = '/unitTest';
  static const form = '/form';
}

class AppPages {
  static String getInitPage() {
    //  if (AppUtils.validateTokenTimeout()) return Routes.root;
    return Routes.walkThrough;
  }

  static final routes = [
    GetPage(
      name: Routes.root,
      page: () => const RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: Routes.signIn,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.walkThrough,
      page: () => const WalkThroughView(),
      binding: WalkThroughBinding(),
    ),
    GetPage(
      name: Routes.beforeAfterImg,
      page: () => const BeforeAfterImageView(),
      binding: BindingsBuilder.put(() => BeforeAfterImageController()),
    ),
    GetPage(
      name: Routes.unitTest,
      page: () => const UnitTestView(),
      binding: UnitTestBinding(),
    ),
    GetPage(
      name: Routes.form,
      page: () => const FormView(),
      binding: BindingsBuilder.put(() => FormController()),
    ),
  ];
}
