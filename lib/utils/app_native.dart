import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppNative {
  static Future<String> deviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();

    if (GetPlatform.isIOS) {
      var deviceData = await deviceInfo.iosInfo;
      return '${deviceData.model}|${deviceData.name}|${deviceData.systemVersion}|${deviceData.identifierForVendor}';
    }

    if (GetPlatform.isAndroid) {
      var deviceData = await deviceInfo.androidInfo;
      return '${deviceData.manufacturer}|${deviceData.model}|${deviceData.androidId}';
    }

    return '';
  }

  static Future<String> getVersionName() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version + '+' + packageInfo.buildNumber;
  }

  static Future<void> makePhoneCall(String number) async {
    if (await canLaunchUrlString('tel:$number')) {
      await launchUrlString('tel:$number');
    } else {
      throw 'Could not launch tel:$number';
    }
  }

  static Future<void> sendSms(String sms) async {
    if (await canLaunchUrlString('sms:$sms')) {
      await launchUrlString('sms:$sms');
    } else {
      throw 'Could not launch sms:$sms';
    }
  }

  static Future<void> sendEmail(String email) async {
    if (await canLaunchUrlString('mailto:$email')) {
      await launchUrlString('mailto:$email');
    } else {
      throw 'Could not launch mailto:$email';
    }
  }

  static Future<void> openAppInStore(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch url:$url';
    }
  }
}
