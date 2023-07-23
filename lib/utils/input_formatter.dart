import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tiengviet/tiengviet.dart';

/// FilteringTextInputFormatter.digitsOnly
/// FilteringTextInputFormatter.deny(' ')
/// FilteringTextInputFormatter.allow(RegExp('[a-z]'))
/// LengthLimitingTextInputFormatter(20)

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(oldValue, TextEditingValue newValue) {
    String text = '';

    for (int i = 0; i < newValue.text.length; i++) {
      text += newValue.text[i];
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != newValue.text.length) {
        text += '-';
      }
    }

    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

class DateNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(oldValue, TextEditingValue newValue) {
    String text = '';

    for (int i = 0; i < newValue.text.length; i++) {
      text += newValue.text[i];
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newValue.text.length) {
        text += '/';
      }
    }

    return newValue.copyWith(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

class MoneyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(oldValue, TextEditingValue newValue) {
    String _text = '';
    String strVal = newValue.text.replaceAll('đ', '');
    num _value = 0;

    if (strVal.isNotEmpty) {
      _value = NumberFormat.currency(locale: 'vi', symbol: 'đ').parse(strVal);
    }
    _text = NumberFormat.currency(locale: 'vi', symbol: 'đ').format(_value);

    return newValue.copyWith(
      text: _text,
      selection: TextSelection.collapsed(offset: _text.length - 2),
    );
  }
}

class TrongTaiInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(oldValue, TextEditingValue newValue) {
    String _text = newValue.text
        .replaceAll('t', '')
        .replaceAll('ấ', '')
        .replaceAll('n', '')
        .replaceAll(' ', '');

    if (_text.isNotEmpty &&
        (_text.substring(0, 1) == ',' || _text.substring(0, 1) == '.')) {
      _text = '0.';
    } else if (_text.replaceAll(',', '.').split('.').length > 2) {
      _text = _text.substring(0, _text.length - 1);
    } else {
      _text = _text.replaceAll(',', '.');
    }

    _text = '$_text tấn';
    return newValue.copyWith(
      text: _text,
      selection: TextSelection.collapsed(offset: _text.length - 4),
    );
  }
}

class NumericalRangeFormatter extends TextInputFormatter {
  final int min;
  final int max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      return newValue.copyWith(text: '$min');
    } else if (int.parse(newValue.text) > max) {
      return newValue.copyWith(
        text: '$max',
        selection: TextSelection.collapsed(offset: '$max'.length),
      );
    } else {
      return newValue;
    }
  }
}

class DauCauInputFormatter extends TextInputFormatter {
  final bool uppercase;

  DauCauInputFormatter({this.uppercase = true});

  @override
  TextEditingValue formatEditUpdate(oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) return newValue;

    var string = TiengViet.parse(newValue.text);

    if (uppercase) string = string.toUpperCase();

    return newValue.copyWith(text: string);
  }
}
