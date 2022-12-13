import 'dart:convert';

import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_main_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/usescase/order_attendance_regisrer_delete.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'order_attendance_register_usecase_test.mocks.dart';

@GenerateMocks([OrderAttendanceRegisterRepository])
void main() {
  late OrderAttendanceRegisterDelete usecase;
  late MockOrderAttendanceRegisterRepository mockOrderAttendanceRegister;

  late ParamsOrderAttendanceRegisterDelete tParams;

  setUp(() {
    mockOrderAttendanceRegister = MockOrderAttendanceRegisterRepository();
    usecase =
        OrderAttendanceRegisterDelete(repository: mockOrderAttendanceRegister);
  });

  final String jsonString = fixture('order_attendance_register_get.json');
  final data = json.decode(jsonString);

  late OrderAttendanceRegisterMainModel tOrderAttendanceRegisterModel;

  tOrderAttendanceRegisterModel = OrderAttendanceRegisterMainModel.fromJson(data);

  tParams = ParamsOrderAttendanceRegisterDelete(id: tOrderAttendanceRegisterModel.orderAttendanceRegister.id);

  test(
    'should delete of OrderAttendanceRegisterModel from the repository',
    () async {
      verify(mockOrderAttendanceRegister.delete(id: tParams.id));
      verifyNoMoreInteractions(mockOrderAttendanceRegister);
    },
  );
}
