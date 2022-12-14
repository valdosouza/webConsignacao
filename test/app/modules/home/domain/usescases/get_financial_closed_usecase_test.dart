import 'dart:convert';

import 'package:appweb/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:appweb/app/modules/home/domain/repository/home_repository.dart';
import 'package:appweb/app/modules/home/domain/usecase/get_financial_closed_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'get_financial_closed_usecase_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  late GetFinancialClosedUseCase usecase;
  late MockHomeRepository mockHomeRepository;

  late Params tParams;
  setUp(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetFinancialClosedUseCase(repository: mockHomeRepository);
  });
  final String jsonString = fixture('home_sales_payment_type.json');
  final data = json.decode(jsonString);

  late List<HomeSalesPaymentTypeModel> tLisTSalesPaymentTypesModel = [];
  tLisTSalesPaymentTypesModel = (data as List).map((json) {
    return HomeSalesPaymentTypeModel(
      paymentType: json['description'].toString(),
      totalValue: double.parse(json['totalValue'].toString()),
      totalQtty: int.parse(json['totalQtty'].toString()),
    );
  }).toList();
  tParams = const Params(
    initialDate: '2020-04-01',
    finalDate: '2020-04-01',
    terminal: "todos",
  );

  test(
    'should get Sales Payment Type from API',
    () async {
      // arrange
      when(mockHomeRepository.getFinancialClosed(
        initialDate: tParams.initialDate,
        finalDate: tParams.finalDate,
        terminal: tParams.terminal,
      )).thenAnswer((_) async => Right(tLisTSalesPaymentTypesModel));
      // act
      final result = await usecase(tParams);
      // assert
      expect(result, Right(tLisTSalesPaymentTypesModel));
      verify(mockHomeRepository.getFinancialClosed(
        initialDate: tParams.initialDate,
        finalDate: tParams.finalDate,
        terminal: tParams.terminal,
      ));
      verifyNoMoreInteractions(mockHomeRepository);
    },
  );
}
