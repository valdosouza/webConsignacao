import 'dart:convert';

import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_main_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/usescase/order_attendance_regisrer_put.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'order_attendance_register_usecase_test.mocks.dart';

@GenerateMocks([OrderAttendanceRegisterRepository])
void main() {
  late OrderAttendanceRegisterPut usecase;
  late MockOrderAttendanceRegisterRepository mockOrderAttendanceRegister;

  late ParamsOrderAttendanceRegisterPut tParams;

  setUp(() {
    mockOrderAttendanceRegister = MockOrderAttendanceRegisterRepository();
    usecase =
        OrderAttendanceRegisterPut(repository: mockOrderAttendanceRegister);
  });

  final String jsonString = fixture('order_attendance_register_get.json');
  final data = json.decode(jsonString);

  late OrderAttendanceRegisterMainModel tOrderAttendanceRegisterModel;

  tOrderAttendanceRegisterModel = OrderAttendanceRegisterMainModel.fromJson(data);

  tParams = ParamsOrderAttendanceRegisterPut(model: tOrderAttendanceRegisterModel);

  test(
    'should put of OrderAttendanceRegisterModel from the repository',
    () async {
      // arrange
      when(mockOrderAttendanceRegister.put(model: tParams.model))
          .thenAnswer((_) async => Right(tOrderAttendanceRegisterModel));
      // act
      final result = await usecase(tParams);
      // assert
      expect(result, Right(tOrderAttendanceRegisterModel));
      verify(mockOrderAttendanceRegister.put(model: tParams.model));
      verifyNoMoreInteractions(mockOrderAttendanceRegister);
    },
  );
}
