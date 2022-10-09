import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '/const/app_configs.dart';

class AppNative {
  static Future<String> deviceName() async {
    final deviceInfo = DeviceInfoPlugin();
    String appVersion = AppConfigs.appName + '-' + AppConfigs.appVersion;

    if (GetPlatform.isIOS) {
      var deviceData = await deviceInfo.iosInfo;
      return '${deviceData.model}|${deviceData.name}|${deviceData.systemVersion}|$appVersion|${deviceData.identifierForVendor}';
    }

    if (GetPlatform.isAndroid) {
      var deviceData = await deviceInfo.androidInfo;
      return '${deviceData.manufacturer}|${deviceData.model}|$appVersion|${deviceData.androidId}';
    }

    return '';
  }

  static Future<String> getVersionName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    return version + '+' + buildNumber;
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
      await canLaunchUrlString(url);
    } else {
      throw 'Could not launch url:$url';
    }
  }
}
