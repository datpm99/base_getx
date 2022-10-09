import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app_theme.dart';

class Styles {
  static ThemeData get light => lightTheme;

  static ThemeData get dark => darkTheme;

  static changeTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }

  /// Colors.
  static const primaryColor = Color(0xff54C5EB);

  //White.
  static const white1 = Color(0xffF5F5F5);
  static const white2 = Color(0xffE7ECF1);
  static const white3 = Color(0xffF2F2FA);
  static const white4 = Color(0xffE5E5E5);
  static const white5 = Color(0xffF4F9FA);
  static const white6 = Color(0xffDFE0EB);
  static const white7 = Color(0xffE9ECEF);
  static const white8 = Color(0xffD4D4DB);
  static const white9 = Color(0xffF4F4F4);
  static const white10 = Color(0xffC4C4C4);

  //Grey.
  static const grey1 = Color(0xFFE0E0E0);
  static const grey2 = Color(0xFFD6D6D6);
  static const grey3 = Color(0xFFBDBDBD);
  static const grey4 = Color(0xffC1C9D2);
  static const grey5 = Color(0xffBBBBBB);
  static const grey6 = Color(0xffACACAC);
  static const grey7 = Color(0xff979797);
  static const grey8 = Color(0xff6D6D6D);
  static const grey9 = Color(0xff6B7280);
  static const grey10 = Color(0xff7B8794);
  static const grey11 = Color(0xffA3AED0);
  static const grey12 = Color(0xff9FA2B4);
  static const grey13 = Color(0xff8E8EA1);
  static const grey14 = Color(0xff4B506D);
  static const grey15 = Color(0xff7A7C80);

  //Black.
  static const black1 = Color(0xff252733);
  static const black2 = Color(0xff22242C);
  static const black3 = Color(0xff323F4B);

  //Blue.
  static const blue1 = Color(0xffEFF8FF);
  static const blue2 = Color(0xffC9ECF3);
  static const blue3 = Color(0xff77E6F7);
  static const blue4 = Color(0xff20C7E0);
  static const blue5 = Color(0xff06BDD9);
  static const blue6 = Color(0xff00C3F9);
  static const blue7 = Color(0xff0FAFE4);
  static const blue8 = Color(0xffd9f3fb);

  //Red.
  static const red1 = Color(0xffFFDBDB);
  static const red2 = Color(0xffFF4A55);
  static const red3 = Color(0xffF41941);
  static const red4 = Color(0xffFF1414);
  static const red5 = Color(0xffF15642);

  //Purple.
  static const purple1 = Color(0xff6160DC);
  static const purple2 = Color(0xff1C49E9);
  static const purple3 = Color(0xff4A50E2);

  //Green.
  static const green1 = Color(0xffDBFFFF);
  static const green2 = Color(0xff20C2C4);

  //Yellow.
  static const yellow = Color(0xffFFAF2E);
  static const yellow1 = Color(0xffFCD405);
  static const yellow2 = Color(0xffFFFBDC);

  //Pink.
  static const pink = Color(0xffF028A0);

  ///TextStyles.
  //Small.
  static TextStyle smallText({Color color = black2}) =>
      TextStyle(color: color, fontSize: 12.sp);

  static TextStyle smallTextW500({Color color = black2}) =>
      TextStyle(color: color, fontSize: 12.sp, fontWeight: FontWeight.w500);

  static TextStyle smallTextW600({Color color = black2}) =>
      TextStyle(color: color, fontSize: 12.sp, fontWeight: FontWeight.w600);

  static TextStyle smallTextW700({Color color = black2}) =>
      TextStyle(color: color, fontSize: 12.sp, fontWeight: FontWeight.w700);

  static TextStyle smallTextW800({Color color = black2}) =>
      TextStyle(color: color, fontSize: 12.sp, fontWeight: FontWeight.w800);

  static TextStyle smallTextW900({Color color = black2}) =>
      TextStyle(color: color, fontSize: 12.sp, fontWeight: FontWeight.w900);

  //Normal.
  static TextStyle normalText({Color color = black2, double size = 14}) =>
      TextStyle(color: color, fontSize: size.sp);

  static TextStyle normalTextW500({Color color = black2, double size = 14}) =>
      TextStyle(color: color, fontSize: size.sp, fontWeight: FontWeight.w500);

  static TextStyle normalTextW600({Color color = black2, double size = 14}) =>
      TextStyle(color: color, fontSize: size.sp, fontWeight: FontWeight.w600);

  static TextStyle normalTextW700({Color color = black2, double size = 14}) =>
      TextStyle(color: color, fontSize: size.sp, fontWeight: FontWeight.w700);

  static TextStyle normalTextW800({Color color = black2, double size = 14}) =>
      TextStyle(color: color, fontSize: size.sp, fontWeight: FontWeight.w800);

  static TextStyle normalTextW900({Color color = black2, double size = 14}) =>
      TextStyle(color: color, fontSize: size.sp, fontWeight: FontWeight.w900);

  //Medium.
  static TextStyle mediumText({Color color = black2}) =>
      TextStyle(color: color, fontSize: 16.sp);

  static TextStyle mediumTextW500({Color color = black2}) =>
      TextStyle(color: color, fontSize: 16.sp, fontWeight: FontWeight.w500);

  static TextStyle mediumTextW600({Color color = black2}) =>
      TextStyle(color: color, fontSize: 16.sp, fontWeight: FontWeight.w600);

  static TextStyle mediumTextW700({Color color = black2}) =>
      TextStyle(color: color, fontSize: 16.sp, fontWeight: FontWeight.w700);

  static TextStyle mediumTextW800({Color color = black2}) =>
      TextStyle(color: color, fontSize: 16.sp, fontWeight: FontWeight.w800);

  static TextStyle mediumTextW900({Color color = black2}) =>
      TextStyle(color: color, fontSize: 16.sp, fontWeight: FontWeight.w900);

  //Big.
  static TextStyle bigText({Color color = black2}) =>
      TextStyle(color: color, fontSize: 18.sp);

  static TextStyle bigTextW500({Color color = black2}) =>
      TextStyle(color: color, fontSize: 18.sp, fontWeight: FontWeight.w500);

  static TextStyle bigTextW600({Color color = black2}) =>
      TextStyle(color: color, fontSize: 18.sp, fontWeight: FontWeight.w600);

  static TextStyle bigTextW700({Color color = black2}) =>
      TextStyle(color: color, fontSize: 18.sp, fontWeight: FontWeight.w700);

  static TextStyle bigTextW800({Color color = black2}) =>
      TextStyle(color: color, fontSize: 18.sp, fontWeight: FontWeight.w800);

  static TextStyle bigTextW900({Color color = black2}) =>
      TextStyle(color: color, fontSize: 18.sp, fontWeight: FontWeight.w900);

  static TextStyle textUnderline({Color color = black2, double size = 14}) =>
      TextStyle(
          color: color,
          fontSize: size.sp,
          decoration: TextDecoration.underline);

  ///Border TextField.
  static OutlineInputBorder inputBorder30({Color color = grey13}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(color: color, width: 1),
    );
  }

  static OutlineInputBorder inputBorder8({Color color = grey13}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: 0.5),
    );
  }

  ///Border Dialog.
  static OutlinedBorder borderDialog({double radius = 8}) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  ///Box shadow.
  //0px 4px 8px rgba(0, 0, 0, 0.15);
  static List<BoxShadow> boxShadow1() {
    return [
      const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.15),
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ];
  }

  ///BoxDecoration.
  static BoxDecoration boxDecoration1(
      {double radius = 8, Color color = Colors.white}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration boxDecoration2(
      {double radius = 8, double border = 1, Color color = grey12}) {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(width: border, color: color),
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
