import 'dart:convert';

import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_main_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/usescase/order_attendance_regisrer_get.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'order_attendance_register_usecase_test.mocks.dart';

@GenerateMocks([OrderAttendanceRegisterRepository])
void main() {
  late OrderAttendanceRegisterGet usecase;
  late MockOrderAttendanceRegisterRepository mockOrderAttendanceRegister;

  late ParamsGetOrderAttendanceRegisterGet tParams;

  setUp(() {
    mockOrderAttendanceRegister = MockOrderAttendanceRegisterRepository();
    usecase =
        OrderAttendanceRegisterGet(repository: mockOrderAttendanceRegister);
  });

  final String jsonString = fixture('order_attendance_register_get.json');
  final data = json.decode(jsonString);

  late OrderAttendanceRegisterMainModel tOrderAttendanceRegisterModel;

  tOrderAttendanceRegisterModel = OrderAttendanceRegisterMainModel.fromJson(data);

  tParams = ParamsGetOrderAttendanceRegisterGet(id: tOrderAttendanceRegisterModel.orderAttendanceRegister.id);

  test(
    'should get of OrderAttendanceRegisterModel from the repository',
    () async {
      // arrange
      when(mockOrderAttendanceRegister.get(id: anyNamed('id')))
          .thenAnswer((_) async => Right(tOrderAttendanceRegisterModel));
      // act
      final result = await usecase(tParams);
      // assert
      expect(result, Right(tOrderAttendanceRegisterModel));
      verify(mockOrderAttendanceRegister.get(id: tParams.id));
      verifyNoMoreInteractions(mockOrderAttendanceRegister);
    },
  );
}
