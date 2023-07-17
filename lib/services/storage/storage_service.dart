import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import '/services/services.dart';
import '/utils/app_native.dart';

class StorageService extends GetxService implements BaseService {
  static StorageService get() => Get.find();

  late GetStorage _box;
  late bool _isFirstLaunch;

  //Base.
  bool get firstLaunch => _isFirstLaunch;

  String get deviceName => _box.read(_Keys.deviceName) ?? '';
  set deviceName(String value) => _write(_Keys.deviceName, value);

  String get deviceID => _box.read(_Keys.deviceID) ?? '';
  set deviceID(String value) => _write(_Keys.deviceID, value);

  String get language => _box.read(_Keys.language) ?? 'vi_VN';
  set language(String value) => _write(_Keys.language, value);

  bool get firstLogin => _box.read(_Keys.firstLogin) ?? false;
  set firstLogin(bool value) => _write(_Keys.firstLogin, value);

  //Auth.
  String get apiToken => _box.read(_Keys.apiToken) ?? '';
  set apiToken(String value) => _write(_Keys.apiToken, value);

  String get authModel => _box.read(_Keys.authModel) ?? '';
  set authModel(String value) => _write(_Keys.authModel, value);

  String get tokenTimeout => _box.read(_Keys.tokenTimeout) ?? '';
  set tokenTimeout(String value) => _write(_Keys.tokenTimeout, value);

  bool get useFingerprint => _box.read(_Keys.useFingerprint) ?? false;
  set useFingerprint(bool value) => _write(_Keys.useFingerprint, value);

  //Data.
  bool get reloadData => _box.read(_Keys.reloadData) ?? false;
  set reloadData(bool value) => _write(_Keys.reloadData, value);

  @override
  Future<void> init() async {
    _box = GetStorage('settings');
    await _box.initStorage;

    _isFirstLaunch = _box.read(_Keys.firstLaunch) ?? true;
    if (_isFirstLaunch) {
      _box.write(_Keys.firstLaunch, false);
      language = 'vi_VN';
    }
    deviceName = await AppNative.deviceInfo();
    deviceID = deviceName.split('|').last;
    deviceID = deviceID.isEmpty ? deviceID : 'null';
  }

  void reset() => _box.erase();

  void _write<T>(String key, T value) {
    value == null ? _box.remove(key) : _box.write(key, value);
  }
}

abstract class _Keys {
  //Base.
  static const String firstLaunch = 'first_launch';
  static const String firstLogin = 'first_login';
  static const String deviceName = 'device_name';
  static const String deviceID = 'device_id';
  static const String language = 'language';

  //Auth.
  static const String apiToken = 'api_token';
  static const String authModel = 'auth_model';
  static const String tokenTimeout = 'tokenTimeout';
  static const String useFingerprint = 'use_finger_print';

  //Data.
  static const String reloadData = 'reload_data';
}
