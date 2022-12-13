import 'dart:convert';

import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  OrderAttendanceRegisterModel tOrderAttendanceModel = OrderAttendanceRegisterModel(
    id: 0,
    tbInstitutionId: 0,
    tbOrderId: 0,
    tbUserId: 0,
    tbCustomerId: 0,
    nameCustomer: "test_customer",
    tbSalesmanId: 0,
    nameSalesman: "test_salesman",
    dtRecord: "test_record",
    note: "test_note",
    status: "test_status",
    visited: "sim",
    charged: "sim",
    stage: "1",
    latitude: "test_latitude",
    longitude: "test_longitude",
  );

  test('should be a subclass of OrderAttendanceModel entity', () async {
    // assert
    expect(tOrderAttendanceModel, isA<OrderAttendanceRegisterModel>());
  });

  test(
    'should return a valid model when the JSON is valid',
    () async {
      // arrange
      final String jsonString = fixture('order_attendance_register.json');
      final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
      // act
      final result = OrderAttendanceRegisterModel.fromJson(jsonMap);
      // assert
      expect(result, tOrderAttendanceModel);
    },
  );
}
