import 'dart:convert';

import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_items_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  var tOrderAttendanceModel = OrderAttendanceRegisterItemsModel(
      tbProductId: "0",
      nameProduct: "test_product",
      bonus: 0,
      leftover: 0,
      devoluttion: 0,
      newConsignment: 0,
      qttyConsigned: 0);

  test('should be a subclass of OrderAttendanceModel entity', () async {
    // assert
    expect(tOrderAttendanceModel, isA<OrderAttendanceRegisterItemsModel>());
  });

  test(
    'should return a valid model when the JSON is valid',
    () async {
      // arrange
      final String jsonString = fixture('order_attendance_register_items.json');
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      // act
      final result = OrderAttendanceRegisterItemsModel.fromJson(jsonMap);
      // assert
      expect(result, tOrderAttendanceModel);
    },
  );
}
