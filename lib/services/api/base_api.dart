import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart';

import '/services/storage/storage_service.dart';
import '/utils/app_utils.dart';

const domain = 'https://jsonplaceholder.typicode.com/';

final _storage = Get.find<StorageService>();

class BaseApi {
  late Dio dio;

  interceptors() async {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (validateSessionTimeout(options.path)) {
          return handler.next(options);
        }
      },
      onResponse: (response, handler) {
        AppUtils.showLogInfo(
          '${response.requestOptions.method}: ${response.requestOptions.uri}'
          '\nPARAMS: ${response.requestOptions.data}'
          '\nRESPONSE: ${response.data}',
        );
        return handler.next(response);
      },
      onError: (DioError e, handler) {
        AppUtils.showLogError(
          '${e.requestOptions.method}: ${e.requestOptions.uri}'
          '\nPARAMS: ${e.requestOptions.data}'
          '\nHEADER: ${e.requestOptions.headers}'
          '\n${e.message}'
          '\n${e.response.toString()}',
        );
        return handler.next(e);
      },
    ));
  }

  validateSessionTimeout(String path) {
    bool isAuth = path.contains('generateCaptcha') ||
        path.contains('login') ||
        path.contains('forget-password') ||
        path.contains('renew-verification-code') ||
        path.contains('loginByEmailAndCode') ||
        path.contains('post') ||
        path.contains('global-app-notification');

    if (isAuth) return true;

    //Case: logout.
    bool validTimeout = AppUtils.validateTokenTimeout();
    if (!validTimeout) {
      AppUtils.logout();
      AppUtils.showError('msg_session_timeout'.tr);
      return false;
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
    dio.options.headers = {};
    if (token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    dio.options.responseType = ResponseType.json;
    dio.options.contentType = 'application/json';

    //Check lang code.
    String localeCode = _storage.language.split('_')[0];
    dio.options.headers['Accept-Language'] = localeCode;
  }

  Future<Response?> getRequest({required String url, String token = '', var data}) async {
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

  Future<Response?> postRequest({required String url, String token = '', required String data}) async {
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

  Future<Response?> putRequest({required String url, String token = '', required String data}) async {
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

  Future<Response?> deleteRequest({required String url, String token = '', var data}) async {
    try {
      settingHeaderRequest(token);
      return await dio.delete(url, data: data);
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
      settingHeaderRequest(token);

      final parFile = await MultipartFile.fromFile(
        file.path,
        filename: file.path.split('/').last,
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

  Future<Response?> uploadMultipleFile(String url, String token, List<File> files) async {
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
