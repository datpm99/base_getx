import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'const/import_const.dart';
import 'lang/lang_controller.dart';
import 'lang/translation_service.dart';
import 'routes/routes.dart';
import 'utils/root_widget.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final lang = Get.find<LangController>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          enableLog: false,
          debugShowCheckedModeBanner: false,
          color: Colors.blue,
          theme: Styles.light,
          darkTheme: Styles.dark,
          title: AppConfigs.appName,
          getPages: AppPages.routes,
          builder: RootWidget.builder,
          initialRoute: AppPages.getInitPage(),
          locale: lang.locale,
          translations: TranslationService(),
          fallbackLocale: TranslationService.fallbackLocale,
          defaultTransition: Transition.fadeIn,
        );
      },
    );
  }
}
