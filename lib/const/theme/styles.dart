import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'themes.dart';

class Styles {
  static ThemeData get light => lightTheme;

  static ThemeData get dark => darkTheme;

  static void changeTheme() {
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
  static const white11 = Color(0xffe8e8e8);

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
  static const grey16 = Color(0xfff9faff);
  static const grey17 = Color(0xffB4BBC2);
  static const grey18 = Color(0xFFF2F5F9);
  static const grey19 = Color(0xFFB4C5D1);
  static const grey20 = Color(0xFF808080);
  static const grey21 = Color(0xFF757575);
  static const grey22 = Color(0xFFDADADA);
  static const grey23 = Color(0xFF777777);
  static const grey24 = Color(0xFF9D9D9D);
  static const grey25 = Color(0xFFF3F3F3);

  //Black.
  static const black1 = Color(0xff252733);
  static const black2 = Color(0xff22242C);
  static const black3 = Color(0xff323F4B);
  static const black4 = Color(0xff778390);

  //Blue.
  static const blue1 = Color(0xffEFF8FF);
  static const blue2 = Color(0xffC9ECF3);
  static const blue3 = Color(0xff77E6F7);
  static const blue4 = Color(0xff20C7E0);
  static const blue5 = Color(0xff06BDD9);
  static const blue6 = Color(0xff00C3F9);
  static const blue7 = Color(0xff0FAFE4);
  static const blue8 = Color(0xffd9f3fb);
  static const blue9 = Color(0xff203afb);
  static const blue10 = Color(0xff4600D9);
  static const blue11 = Color(0xff345FFB);

  //Red.
  static const red1 = Color(0xffFFDBDB);
  static const red2 = Color(0xffFF4A55);
  static const red3 = Color(0xffF41941);
  static const red4 = Color(0xffFF1414);
  static const red5 = Color(0xffF15642);
  static const red6 = Color(0xffff9781);
  static const red7 = Color(0xffe43649);
  static const red8 = Color(0xffF12727);

  //Purple.
  static const purple1 = Color(0xff6160DC);
  static const purple2 = Color(0xff1C49E9);
  static const purple3 = Color(0xff4A50E2);
  static const purple4 = Color(0xff8998fe);
  static const purple5 = Color(0xffE8E6FD);
  static const purple6 = Color(0xff5959fc);
  static const purple7 = Color(0xff510AD7);
  static const purple8 = Color(0xff7900F5);

  //Green.
  static const green1 = Color(0xffDBFFFF);
  static const green2 = Color(0xff20C2C4);
  static const green3 = Color(0xff73d7d3);
  static const green4 = Color(0xff45c7db);
  static const green5 = Color(0xff22ce9a);
  static const green6 = Color(0xFF2B5266);
  static const green7 = Color(0xFF18CF18);
  static const green8 = Color(0xff217b56);
  static const green9 = Color(0xffbdd7cc);

  //Yellow.
  static const yellow = Color(0xffFFAF2E);
  static const yellow1 = Color(0xffFCD405);
  static const yellow2 = Color(0xffFFFBDC);
  static const yellow3 = Color(0xfff4b428);
  static const yellow4 = Color(0xfff3b45c);
  static const yellow5 = Color(0xffFBC800);
  static const yellow6 = Color(0xffffd644);

  //Orange.
  static const orange = Color(0xfffc4a1a);

  //Pink.
  static const pink = Color(0xffF028A0);
  static const pink2 = Color(0xffff8080);
  static const pink3 = Color(0xffFFF6F7);
  static const pink4 = Color(0xffFCD8DC);

  ///TextStyles.
  static TextStyle getTextStyle(color, double font, fontWeight) => TextStyle(
        color: color,
        fontSize: font.sp,
        fontWeight: fontWeight,
        fontFamily: GoogleFonts.mulish().fontFamily,
      );

  //Small.
  static TextStyle smallText({Color color = black2}) =>
      getTextStyle(color, 12, FontWeight.normal);

  static TextStyle smallTextW500({Color color = black2}) =>
      getTextStyle(color, 12, FontWeight.w500);

  static TextStyle smallTextW600({Color color = black2}) =>
      getTextStyle(color, 12, FontWeight.w600);

  static TextStyle smallTextW700({Color color = black2}) =>
      getTextStyle(color, 12, FontWeight.w700);

  static TextStyle smallTextW800({Color color = black2}) =>
      getTextStyle(color, 12, FontWeight.w800);

  static TextStyle smallTextW900({Color color = black2}) =>
      getTextStyle(color, 12, FontWeight.w900);

  //Normal.
  static TextStyle normalText({Color color = black2, double size = 14}) =>
      getTextStyle(color, size, FontWeight.normal);

  static TextStyle normalTextW500({Color color = black2, double size = 14}) =>
      getTextStyle(color, size, FontWeight.w500);

  static TextStyle normalTextW600({Color color = black2, double size = 14}) =>
      getTextStyle(color, size, FontWeight.w600);

  static TextStyle normalTextW700({Color color = black2, double size = 14}) =>
      getTextStyle(color, size, FontWeight.w700);

  static TextStyle normalTextW800({Color color = black2, double size = 14}) =>
      getTextStyle(color, size, FontWeight.w800);

  static TextStyle normalTextW900({Color color = black2, double size = 14}) =>
      getTextStyle(color, size, FontWeight.w900);

  //Medium.
  static TextStyle mediumText({Color color = black2}) =>
      getTextStyle(color, 16, FontWeight.normal);

  static TextStyle mediumTextW500({Color color = black2}) =>
      getTextStyle(color, 16, FontWeight.w500);

  static TextStyle mediumTextW600({Color color = black2}) =>
      getTextStyle(color, 16, FontWeight.w600);

  static TextStyle mediumTextW700({Color color = black2}) =>
      getTextStyle(color, 16, FontWeight.w700);

  static TextStyle mediumTextW800({Color color = black2}) =>
      getTextStyle(color, 16, FontWeight.w800);

  static TextStyle mediumTextW900({Color color = black2}) =>
      getTextStyle(color, 16, FontWeight.w900);

  //Big.
  static TextStyle bigText({Color color = black2}) =>
      getTextStyle(color, 18, FontWeight.normal);

  static TextStyle bigTextW500({Color color = black2}) =>
      getTextStyle(color, 18, FontWeight.w500);

  static TextStyle bigTextW600({Color color = black2}) =>
      getTextStyle(color, 18, FontWeight.w600);

  static TextStyle bigTextW700({Color color = black2}) =>
      getTextStyle(color, 18, FontWeight.w700);

  static TextStyle bigTextW800({Color color = black2}) =>
      getTextStyle(color, 18, FontWeight.w800);

  static TextStyle bigTextW900({Color color = black2}) =>
      getTextStyle(color, 18, FontWeight.w900);

  static TextStyle textUnderline({
    Color color = black2,
    double size = 14,
    FontWeight fWeight = FontWeight.w500,
  }) =>
      TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: fWeight,
        decoration: TextDecoration.underline,
        fontFamily: GoogleFonts.mulish().fontFamily,
      );

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

  static List<BoxShadow> boxShadow2() {
    return [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 4,
        spreadRadius: 1,
        offset: const Offset(0, 0),
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
