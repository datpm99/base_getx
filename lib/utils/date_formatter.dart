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

  /// Format DateTime => String.
  static String dateToStr1(DateTime date) {
    return DateFormat("dd/MM/yyyy").format(date);
  }

  static String dateToStr2(DateTime date) {
    return DateFormat("HH:mm dd/MM/yyyy").format(date);
  }

  static String dateToStr3(DateTime date) {
    return DateFormat("yyyy-MM-dd").format(date);
  }

  /// Format String => DateTime.
  static DateTime strToDate1(String date) {
    return DateFormat("dd/MM/yyyy").parse(date);
  }

  /// Format Date Utc => Local.
  static DateTime utcToLocal1(String dateUtc) {
    DateTime date = DateFormat("yyyy-MM-ddTHH:mm:sssZ").parse(dateUtc, true);
    return date.toLocal();
  }

  static String utcToLocal2(String dateUtc) {
    if (dateUtc.isEmpty) return '';
    final date = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateUtc, true);
    return DateFormat("dd/MM/yyyy").format(date.toLocal());
  }

  static String utcToLocal3(String dateUtc) {
    if (dateUtc.isEmpty) return '';
    final date = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateUtc, true);
    return DateFormat("dd/MM/yyyy - HH:mm").format(date.toLocal());
  }

  static String utcToLocal4(String dateUtc) {
    if (dateUtc.isEmpty) return '';
    final date = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateUtc, true);
    return DateFormat("HH:mm dd/MM/yyyy").format(date.toLocal());
  }

  static String utcToLocal5(String dateUtc) {
    if (dateUtc.isEmpty) return '';
    final date = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateUtc, true);
    return DateFormat("dd/MM/yyyy").format(date.toLocal());
  }

  /// Format Date Local => Utc.
  static String localToUtc1(DateTime date) {
    return DateFormat("yyyy-MM-ddTHH:mm:sssZ").format(date);
  }

  ///Other.
  static String formatDate1(String val) {
    var dt = DateTime.fromMillisecondsSinceEpoch(int.parse(val));
    return DateFormat('dd/MM/yy HH:mm').format(dt);
  }
}
