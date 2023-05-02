import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/lang/lang_controller.dart';

class DateFormatter {
  static final lang = Get.find<LangController>();

  ///Date picker.
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

  ///Format date.
  static String formatDate2(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  static String formatDate3(DateTime date) {
    return DateFormat("ddMMyyyy").format(date);
  }

  static String formatDate4(DateTime date) {
    return DateFormat("HH:mm dd/MM/yyyy").format(date);
  }

  static String formatDate5(String val) {
    if (val.isEmpty) return '';
    final dateFormat = DateFormat("dd/MM/yyyy HH:mm:ss");
    final date = dateFormat.parse(val);
    return DateFormat("HH:mm:ss dd/MM/yyyy").format(date);
  }

  static String formatDate6(DateTime date) {
    return DateFormat("HH:mm").format(date);
  }

  static DateTime formatDate7(String date) {
    String day = date.substring(0, 2);
    String month = date.substring(2, 4);
    String year = date.substring(4, 8);
    String newDate = day + '/' + month + '/' + year;
    return DateFormat("dd/MM/yyyy").parse(newDate);
  }

  static DateTime formatDate8(String date) {
    return DateFormat("dd/MM/yyyy").parse(date);
  }

  static String formatDate10(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  static DateTime formatDate11(String date) {
    return DateFormat("yyyy-MM-dd").parse(date);
  }

  static String formatUtcDate(String val) {
    if (val.isEmpty) return '';
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    DateTime date = dateFormat.parse(val, true);
    return DateFormat("HH:mm - dd/MM/yyyy").format(date.toLocal());
  }

  static String formatUtcDate2(String val) {
    if (val.isEmpty) return '';
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    DateTime date = dateFormat.parse(val, true);
    return DateFormat("HH:mm - dd/MM/yyyy").format(date);
  }

  static String formatDateTimezone(String val) {
    if (val.isEmpty) return '';
    DateFormat dateFormat = DateFormat("HH:mm dd/MM/yyyy");
    DateTime date = dateFormat.parse(val);
    return DateFormat("yyyy-MM-ddTHH:mm:ss").format(date.toUtc());
  }

  static String formatDateTimeTypeFm(String val, String fm) {
    if (val.isEmpty) return '';
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    DateTime date = dateFormat.parse(val, true);
    return DateFormat(fm).format(date);
  }
}
