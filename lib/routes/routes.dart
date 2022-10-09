import 'package:get/get.dart';
import '/pages/pages.dart';

class Routes {
  static const root = '/';

  static const notice = '/notice';
  static const report = '/report';
  static const home = '/home';
  static const unit = '/unit';
  static const user = '/user';

  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const otp = '/otp';

  static const profile = '/profile';
}

class AppPages {
  static String initPage = Routes.signIn;

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
      name: Routes.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.otp,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
