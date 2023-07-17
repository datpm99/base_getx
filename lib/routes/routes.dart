import 'package:get/get.dart';
import '/pages/pages.dart';
import '/utils/app_utils.dart';

class Routes {
  static const root = '/';

  static const animation = '/animation';
  static const utility = '/utility';
  static const home = '/home';
  static const chart = '/chart';
  static const setting = '/setting';

  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const otp = '/otp';

  //Widget material.
  static const walkThrough = '/walkThrough';
  static const checkBox = '/checkBox';
  static const chip = '/chip';
  static const colorFiltered = '/colorFiltered';

  //Widget cupertino.
  static const contextMenu = '/contextMenu';
  static const slidingSegmented = '/slidingSegmented';

  //Chart.
  static const pieChart = '/pieChart';
  static const lineChart = '/lineChart';
  static const barChart = '/barChart';

  //Utility.
  static const beforeAfterImg = '/beforeAfterImg';
  static const showCase = '/showCase';
  static const tinderCard = '/tinderCard';
  static const unitTest = '/unitTest';
  static const paint = '/paint';
}

class AppPages {
  static String getInitPage() {
    if (AppUtils.validateTokenTimeout()) return Routes.root;
    return Routes.signIn;
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
      name: Routes.signUp,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.otp,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),

    //Widget material.
    GetPage(
      name: Routes.walkThrough,
      page: () => const WalkThroughView(),
      binding: WalkThroughBinding(),
    ),
    GetPage(
      name: Routes.checkBox,
      page: () => const CheckBoxView(),
      binding: BindingsBuilder.put(() => CheckBoxController()),
    ),
    GetPage(
      name: Routes.chip,
      page: () => const ChipView(),
      binding: BindingsBuilder.put(() => ChipController()),
    ),
    GetPage(
      name: Routes.colorFiltered,
      page: () => const ColorFilteredView(),
      binding: BindingsBuilder.put(() => ColorFilteredController()),
    ),

    //Widget cupertino.
    GetPage(
      name: Routes.contextMenu,
      page: () => const CusContextMenuView(),
      binding: BindingsBuilder.put(() => CusContextMenuController()),
    ),
    GetPage(
      name: Routes.slidingSegmented,
      page: () => const SlidingSegmentedView(),
      binding: BindingsBuilder.put(() => SlidingSegmentedController()),
    ),

    //Chart.
    GetPage(
      name: Routes.pieChart,
      page: () => const PieChartView(),
      binding: BindingsBuilder.put(() => PieChartController()),
    ),
    GetPage(
      name: Routes.lineChart,
      page: () => const LineChartView(),
      binding: BindingsBuilder.put(() => LineChartController()),
    ),
    GetPage(
      name: Routes.barChart,
      page: () => const BarChartView(),
      binding: BindingsBuilder.put(() => BarChartController()),
    ),

    //Utility.
    GetPage(
      name: Routes.beforeAfterImg,
      page: () => const BeforeAfterImageView(),
      binding: BindingsBuilder.put(() => BeforeAfterImageController()),
    ),
    GetPage(
      name: Routes.showCase,
      page: () => const ShowCaseView(),
      binding: BindingsBuilder.put(() => ShowcaseController()),
    ),
    GetPage(
      name: Routes.tinderCard,
      page: () => const TinderCardView(),
      binding: BindingsBuilder.put(() => TinderCardController()),
    ),
    GetPage(
      name: Routes.unitTest,
      page: () => const UnitTestView(),
      binding: UnitTestBinding(),
    ),
    GetPage(
      name: Routes.paint,
      page: () => const PaintView(),
      binding: BindingsBuilder.put(() => PaintController()),
    ),
  ];
}
