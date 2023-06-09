import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/lang/lang_controller.dart';

class DateFormatter {
  static final lang = Get.find<LangController>();

  /// Date picker.
  static Future<DateTime?> datePicker(BuildContext ctx,
      {required DateTime initDate, required String errorFormatText}) async {
    return await showDatePicker(
      locale: lang.locale,
      context: ctx,
      initialDate: initDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
      errorFormatText: errorFormatText,
    );
  }

  static Future<DateTime?> dateNowPicker(BuildContext ctx,
      {required DateTime initDate, required String errorInvalidText}) async {
    return await showDatePicker(
      locale: lang.locale,
      context: ctx,
      initialDate: initDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
      errorInvalidText: errorInvalidText,
      fieldHintText: 'dd/mm/yyyy',
    );
  }

  /// Format date.
  static String formatDate1(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  static String formatDate2(DateTime date) {
    return DateFormat("HH:mm dd/MM/yyyy").format(date);
  }

  static String formatDate3(String val) {
    if (val.isEmpty) return '';
    final date = DateFormat("dd/MM/yyyy HH:mm:ss").parse(val);
    return DateFormat("HH:mm:ss dd/MM/yyyy").format(date);
  }

  static DateTime formatDate4(String date) {
    return DateFormat("dd/MM/yyyy").parse(date);
  }
}
