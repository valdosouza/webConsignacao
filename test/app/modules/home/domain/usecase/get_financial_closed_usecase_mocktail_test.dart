import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/home/data/model/home_sales_payment_type_model.dart';
import 'package:appweb/app/modules/home/domain/repository/home_repository.dart';
import 'package:appweb/app/modules/home/domain/usecase/get_financial_closed_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetFinancialClosedUseCase usecase;
  late MockHomeRepository mockRepository;

  final tList = [
    const HomeSalesPaymentTypeModel(
      paymentType: 'DINHEIRO',
      totalQtty: 2,
      totalValue: 100.0,
    ),
  ];

  setUp(() {
    mockRepository = MockHomeRepository();
    usecase = GetFinancialClosedUseCase(repository: mockRepository);
  });

  group('GetFinancialClosedUseCase', () {
    test('returns Right(list) when repository succeeds', () async {
      when(() => mockRepository.getFinancialClosed(
            initialDate: any(named: 'initialDate'),
            finalDate: any(named: 'finalDate'),
            terminal: any(named: 'terminal'),
          )).thenAnswer((_) async => Right(tList));

      final result = await usecase(const Params(
        initialDate: '2024-01-01',
        finalDate: '2024-01-31',
        terminal: 'Todos',
      ));

      expect(result.getOrElse(() => []), tList);
      // UseCase passes params.finalDate for both initialDate and finalDate
      verify(() => mockRepository.getFinancialClosed(
            initialDate: '2024-01-31',
            finalDate: '2024-01-31',
            terminal: 'Todos',
          )).called(1);
    });

    test('returns Left when repository fails', () async {
      when(() => mockRepository.getFinancialClosed(
            initialDate: any(named: 'initialDate'),
            finalDate: any(named: 'finalDate'),
            terminal: any(named: 'terminal'),
          )).thenAnswer((_) async => Left(ServerFailure()));

      final result = await usecase(const Params(
        initialDate: '2024-01-01',
        finalDate: '2024-01-31',
        terminal: 'Todos',
      ));

      expect(result.isLeft(), true);
    });
  });
}
