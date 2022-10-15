import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/domain/repositories/stock_list_repository.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usescases/stock_list_getlist.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockStockListRepository extends Mock implements StockListRepository {}

void main() {
  StockListGetlist usescase;
  MockStockListRepository mockStockListRepository;

  setUp(() {
    mockStockListRepository = MockStockListRepository();
    usescase = StockListGetlist(repository: mockStockListRepository);
  });

  const tInstitution = 1;
  const StockListModel item = StockListModel(
      id: 1, institution: 1, description: 'Principal', main: 'S', active: 'S');
  const List<StockListModel> tListStock = [item, item];

  test(
    'should show de list of stocks from the repository',
    () async {
      //arrange
      mockStockListRepository = MockStockListRepository();
      usescase = StockListGetlist(repository: mockStockListRepository);

      when(mockStockListRepository.getList(institutionId: tInstitution))
          .thenAnswer((_) async => const Right(tListStock));
      //act
      final result =
          await usescase.call(const Params(institutionId: tInstitution));
      //assert
      expect(result, const Right(tListStock));
      verify(mockStockListRepository.getList(institutionId: tInstitution));
      verifyNoMoreInteractions(mockStockListRepository);
    },
  );
}
