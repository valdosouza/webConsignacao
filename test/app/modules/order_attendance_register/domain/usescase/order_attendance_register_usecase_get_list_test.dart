import 'dart:convert';

import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/repository/order_attendance_repository.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/usescase/order_attendance_regisrer_get_list.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'order_attendance_register_usecase_test.mocks.dart';

@GenerateMocks([OrderAttendanceRegisterRepository])
void main() {
  late OrderAttendanceRegisterGetlist usecase;
  late MockOrderAttendanceRegisterRepository mockOrderAttendanceRegister;

  late ParamsOrderAttendanceRegisterGetlist tParams;

  setUp(() {
    mockOrderAttendanceRegister = MockOrderAttendanceRegisterRepository();
    usecase =
        OrderAttendanceRegisterGetlist(repository: mockOrderAttendanceRegister);
  });

  final String jsonString = fixture('order_attendance_register__mock.json');
  final data = json.decode(jsonString);

  late List<OrderAttendanceRegisterModel> tLisTOrderAttendanceRegisterModel = [];

  tLisTOrderAttendanceRegisterModel = (data as List).map((json) {
    return OrderAttendanceRegisterModel.fromJson(json);
  }).toList();

  tParams = ParamsOrderAttendanceRegisterGetlist(id: 0);

  test(
    'should get list of OrderAttendanceRegisterModel from the repository',
    () async {
      // arrange
      when(mockOrderAttendanceRegister.getList(id: anyNamed('id')))
          .thenAnswer((_) async => Right(tLisTOrderAttendanceRegisterModel));
      // act
      final result = await usecase(tParams);
      // assert
      expect(result, Right(tLisTOrderAttendanceRegisterModel));
      verify(mockOrderAttendanceRegister.getList(id: tParams.id));
      verifyNoMoreInteractions(mockOrderAttendanceRegister);
    },
  );
}
