import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'const/common_export.dart';
import 'lang/lang_controller.dart';
import 'lang/translation_service.dart';
import 'routes/routes.dart';
import 'utils/root_widget.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final lang = Get.find<LangController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('vi'), Locale('en')],
      enableLog: false,
      debugShowCheckedModeBanner: false,
      color: Styles.primaryColor,
      theme: Styles.light,
      darkTheme: Styles.dark,
      title: AppConfigs.appName,
      getPages: AppPages.routes,
      builder: MyRootWidget.builder,
      initialRoute: AppPages.getInitPage(),
      locale: lang.locale,
      translations: TranslationService(),
      fallbackLocale: TranslationService.fallbackLocale,
      defaultTransition: Transition.fadeIn,
    );
  }
}
