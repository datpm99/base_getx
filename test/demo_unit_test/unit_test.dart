import 'dart:convert';

import 'package:base_getx/pages/unit_test/services/unit_test_service.dart';
import 'package:base_getx/pages/unit_test/unit_test_controller.dart';
import 'package:base_getx/services/api/base_api.dart';
import 'package:test/test.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await Get.put(BaseApi()).init();
  final counter = UnitTestController();
  final service = UnitTestService();
  Get.put(counter);

  group('Counter', () {
    test('value should start at 0', () {
      expect(counter.count, 0);
    });

    test('value should be incremented', () {
      counter.count = 0;
      counter.increment();

      expect(counter.count, 1);
    });

    test('value should be decremented', () {
      counter.count = 0;
      counter.decrement();

      expect(counter.count, -1);
    });
  });

  // group('API', () {
  //   test('test getListComment', () async {
  //     int length = 0;
  //     final result = await service.getListComment();
  //     if(result != null) length = result.length;
  //     expect(length, 5);
  //   });
  //
  //   test('test postComment', () async{
  //     int userId = 0;
  //     Map<String, dynamic> request = {
  //       "title": "foo1",
  //       "body": "bar",
  //       "userId": 1
  //     };
  //     final result = await service.postComment(jsonEncode(request));
  //     if(result != null) {
  //       userId = result.userId;
  //     }
  //
  //     expect(userId, 1);
  //   });
  // });
}
