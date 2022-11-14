import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '/services/storage/storage_service.dart';
import '/utils/app_utils.dart';

//const domain= 'https://service.mdo.com.vn/api/';
const domain = 'https://mdo-staging.bssd.vn/api/';
//const domain = 'https://vpswebdev.bssd.vn/api/';
final _storage = Get.find<StorageService>();

class BaseApi {
  late Dio dio;

  interceptors() async {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      if (validateSessionTimeout(options.path)) {
        return handler.next(options);
      }
    }, onResponse: (response, handler) async {
      if (!kReleaseMode) {
        debugPrint('=================================================\n');
        debugPrint('METHOD: ${response.requestOptions.method}');
        debugPrint('REQUEST: ${response.requestOptions.uri}');
        debugPrint('PARAMS: ${response.requestOptions.data}');
        debugPrint('HEADER: ${response.requestOptions.headers}');
        debugPrint('RESPONSE: ${jsonEncode(response.data)}');
        debugPrint('=================================================\n');
      }

      return handler.next(response);
    }, onError: (DioError e, handler) {
      debugPrint('=================================================\n');
      debugPrint('ERROR: ${e.message}');
      debugPrint('=================================================\n');
      return handler.next(e); //continue
    }));
  }

  validateSessionTimeout(String path) {
    bool isAuth = path.contains('generateCaptcha') ||
        path.contains('login') ||
        path.contains('forget-password') ||
        path.contains('renew-verification-code') ||
        path.contains('loginByEmailAndCode') ||
        path.contains('global-app-notification');
    if (!isAuth) {
      //Case: logged out.
      if (_storage.sessionTimeout.isEmpty) return false;
      bool isValidateSessionTimeout = AppUtils.validateSessionTimeout();
      if (!isValidateSessionTimeout) {
        AppUtils.logout();
        AppUtils.showError('msg_session_timeout'.tr);
        return false;
      }
    }

    return true;
  }

  Future<void> init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: domain,
        headers: {'content-type': 'application/json'},
        connectTimeout: 120 * 1000,
        receiveTimeout: 120 * 1000,
        sendTimeout: 120 * 1000, // 120s
      ),
    );
    await interceptors();
  }

  void settingHeaderRequest(String token) {
    if (token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }
    dio.options.headers['domain'] = _storage.companyCode;
    dio.options.responseType = ResponseType.json;
    dio.options.contentType = 'application/json';

    //Check lang code.
    String localeCode = _storage.language.split('_')[0];
    dio.options.headers['Accept-Language'] = localeCode;
  }

  Future<Response?> getRequest(
      {required String url, String token = '', var data}) async {
    try {
      settingHeaderRequest(token);

      if (data != null) return await dio.get(url, queryParameters: data);
      return await dio.get(url);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Response?> postRequest(
      {required String url, String token = '', required String data}) async {
    try {
      settingHeaderRequest(token);
      return await dio.post(url, data: data);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Response?> putRequest(String url, String token, String data) async {
    try {
      settingHeaderRequest(token);
      return await dio.put(url, data: data);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Response?> getFileRequest(String url, String token, {var data}) async {
    try {
      settingHeaderRequest(token);
      dio.options.responseType = ResponseType.bytes;

      if (data != null) return await dio.get(url, queryParameters: data);
      return await dio.get(url);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Response?> uploadFile(String url, String token, File file) async {
    try {
      String fileName = file.path.split('/').last;
      settingHeaderRequest(token);

      final parFile = await MultipartFile.fromFile(
        file.path,
        filename: fileName,
        contentType: MediaType('image', 'png'),
      );
      FormData formData = FormData.fromMap({
        "file": parFile,
        "fileType": 'FILE_IMAGE_SIGNATURE',
      });
      return await dio.post(url, data: formData);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

  Future<Response?> uploadMultipleFile(
      String url, String token, List<File> files) async {
    try {
      settingHeaderRequest(token);
      dio.options.contentType = 'multipart/form-data';

      final formData = FormData();

      for (File file in files) {
        final itemFile = await MultipartFile.fromFile(
          file.path,
          filename: basename(file.path),
        );
        formData.files.add(MapEntry("files", itemFile));
      }

      formData.fields.add(const MapEntry("fileType", 'FILE_EXTRA'));

      return await dio.post(url, data: formData);
    } on DioError catch (e) {
      if (e.response != null) return e.response;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
