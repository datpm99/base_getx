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
  static const profile = '/profile';

  //Widget material.
  static const bottomSheet = '/bottomSheet';
  static const walkThrough = '/walkThrough';
  static const walkThrough1 = '/walkThrough1';
  static const walkThrough2 = '/walkThrough2';
  static const walkThrough3 = '/walkThrough3';
  static const detail = '/detail';
  static const detail1 = '/detail1';
  static const detail2 = '/detail2';
  static const detail3 = '/detail3';
  static const checkBox = '/checkBox';
  static const chip = '/chip';
  static const stepper = '/stepper';
  static const colorFiltered = '/colorFiltered';

  //Widget cupertino.
  static const contextMenu = '/contextMenu';
  static const picker = '/picker';
  static const slidingSegmented = '/slidingSegmented';

  //Chart.
  static const pieChart = '/pieChart';
  static const lineChart = '/lineChart';
  static const barChart = '/barChart';

  //Utility.
  static const beforeAfterImg = '/beforeAfterImg';
  static const confetti = '/confetti';
  static const showCase = '/showCase';
  static const tinderCard = '/tinderCard';
  static const unitTest = '/unitTest';
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
    GetPage(
      name: Routes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.bottomSheet,
      page: () => const BottomSheetView(),
      binding: BottomSheetBinding(),
    ),

    //WalkThrough.
    GetPage(
      name: Routes.walkThrough,
      page: () => const WalkThroughView(),
      binding: WalkThroughBinding(),
    ),
    GetPage(
      name: Routes.walkThrough1,
      page: () => const WalkThrough1View(),
      binding: BindingsBuilder.put(() => WalkThrough1Controller()),
    ),
    GetPage(
      name: Routes.walkThrough2,
      page: () => const WalkThrough2View(),
      binding: BindingsBuilder.put(() => WalkThrough2Controller()),
    ),
    GetPage(
      name: Routes.walkThrough3,
      page: () => const WalkThrough3View(),
      binding: BindingsBuilder.put(() => WalkThrough3Controller()),
    ),

    //Detail.
    GetPage(
      name: Routes.detail,
      page: () => const DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: Routes.detail1,
      page: () => const Detail1View(),
      binding: BindingsBuilder.put(() => Detail1Controller()),
    ),
    GetPage(
      name: Routes.detail2,
      page: () => const Detail2View(),
      binding: BindingsBuilder.put(() => Detail2Controller()),
    ),
    GetPage(
      name: Routes.detail3,
      page: () => const Detail3View(),
      binding: BindingsBuilder.put(() => Detail3Controller()),
    ),

    //Checkbox.
    GetPage(
      name: Routes.checkBox,
      page: () => const CheckBoxView(),
      binding: BindingsBuilder.put(() => CheckBoxController()),
    ),

    //Chip.
    GetPage(
      name: Routes.chip,
      page: () => const ChipView(),
      binding: BindingsBuilder.put(() => ChipController()),
    ),

    //Stepper.
    GetPage(
      name: Routes.stepper,
      page: () => const StepperView(),
      binding: BindingsBuilder.put(() => StepperController()),
    ),

    //ColorFiltered.
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
      name: Routes.picker,
      page: () => const CusPickerView(),
      binding: BindingsBuilder.put(() => CusPickerController()),
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
      name: Routes.confetti,
      page: () => const ConfettiView(),
      binding: BindingsBuilder.put(() => ConfettiGetController()),
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
  ];
}
