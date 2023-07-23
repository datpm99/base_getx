import 'package:get/get.dart';

class AppValidation {
  static String? empty(String? val, String label) {
    if (val!.trim().isEmpty) return 'msg_empty'.trParams({'label': label.tr});
    return null;
  }

  static String? email(String? val) {
    if (val!.isEmpty) return 'msg_empty'.trParams({'label': 'Email'});
    if (!val.isEmail) return 'msg_invalid'.trParams({'label': 'Email'});
    return '';
  }

  static String? username(String? val) {
    if (val!.trim().isEmpty) return 'msg_empty'.trParams({'label': 'full_name'.tr});
    return null;
  }

  static String? phone(String? val) {
    val = val!.trim();
    RegExp regex = RegExp(
        r"^(0)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}\b");
    if (val.isEmpty) return 'msg_empty'.trParams({'label': 'phone'.tr});
    if (val.length < 10) return 'msg_invalid'.trParams({'label': 'phone'.tr});
    if (val.length > 11) return 'msg_invalid'.trParams({'label': 'phone'.tr});
    if (val.contains(' ')) return 'msg_invalid'.trParams({'label': 'phone'.tr});
    if (!regex.hasMatch(val)) {
      return 'msg_invalid'.trParams({'label': 'phone'.tr});
    }
    return '';
  }

  static String? changePassword(String? val, String name) {
    String pattern =
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~@#$%^&*+=])[A-Za-z\d~@#$%^&*+=]{8,50}$";
    RegExp regex = RegExp(pattern);
    if (val!.isEmpty) return 'msg_empty'.trParams({'label': name.tr});

    if (val.length < 8) {
      return 'msg_length_pass'.trParams({'label': name.tr});
    }

    if (!regex.hasMatch(val)) {
      return 'msg_pass_invalid'.trParams({'label': name.tr});
    }

    return null;
  }

  static String? matchPasswords(String? val1, String? val2) {
    if (val1 != val2) return 'msg_match_pass'.tr;
    return null;
  }

  static String? captcha(String? val) {
    val = val!.trim();
    String pattern = r"^[0-9a-zA-Z]+$";
    RegExp regex = RegExp(pattern);
    if (val.isEmpty) return 'msg_empty'.trParams({'label': 'Captcha'});
    if (val.length < 5) return 'captcha_invalid';
    if (!regex.hasMatch(val)) return 'captcha_invalid';
    return null;
  }
}
