import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/lang/lang_controller.dart';

class TimeFormatter {
  static final lang = Get.find<LangController>();

  ///Time picker.
  static Future<TimeOfDay?> timeNowPicker(BuildContext ctx) async {
    return await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: ctx,
      builder: (context, child) {
        if (MediaQuery.of(context).alwaysUse24HourFormat) {
          return child!;
        } else {
          return Localizations.override(
            context: context,
            locale: lang.locale,
            child: child,
          );
        }
      },
    );
  }

  static Future<TimeOfDay?> timePicker(BuildContext ctx, TimeOfDay time) async {
    return await showTimePicker(
      initialTime: time,
      context: ctx,
      builder: (context, child) {
        if (MediaQuery.of(context).alwaysUse24HourFormat) {
          return child!;
        } else {
          return Localizations.override(
            context: context,
            locale: lang.locale,
            child: child,
          );
        }
      },
    );
  }

  ///Format time.
}
