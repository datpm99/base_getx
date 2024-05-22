import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '/service/services.dart';

class StorageService extends GetxService implements BaseService {
  static StorageService get() => Get.find();

  late GetStorage _box;
  late bool _isFirstLaunch;

  //Base.
  bool get firstLaunch => _isFirstLaunch;

  String get language => _box.read(_Keys.language) ?? 'vi_VN';
  set language(String value) => _write(_Keys.language, value);

  //Auth.
  String get accessToken => _box.read(_Keys.accessToken) ?? '';
  set accessToken(String value) => _write(_Keys.accessToken, value);

  String get refreshToken => _box.read(_Keys.refreshToken) ?? '';
  set refreshToken(String value) => _write(_Keys.refreshToken, value);

  String get tokenTimeout => _box.read(_Keys.tokenTimeout) ?? '';
  set tokenTimeout(String value) => _write(_Keys.tokenTimeout, value);

  @override
  Future<void> init() async {
    _box = GetStorage('settings');
    await _box.initStorage;

    _isFirstLaunch = _box.read(_Keys.firstLaunch) ?? true;
    if (_isFirstLaunch) {
      _box.write(_Keys.firstLaunch, false);
      language = 'vi_VN';
    }
  }

  void reset() => _box.erase();

  void _write<T>(String key, T value) {
    value == null ? _box.remove(key) : _box.write(key, value);
  }
}

abstract class _Keys {
  //Base.
  static const String firstLaunch = 'first_launch';
  static const String language = 'language';

  //Auth.
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String tokenTimeout = 'token_timeout';
}
