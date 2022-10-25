import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/domain/repository/stock_list_repository.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usecase/stock_list_getlist.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stock_list_getlist_test.mocks.dart';

// será criada automaticament flutter pub run build_runner build
//class MockStockListRepository extends Mock implements StockListRepository {}

@GenerateMocks([StockListRepository])
void main() {
  late StockListGetlist usecase;
  late MockStockListRepository mockStockListRepository;
  late Params tParams;

  setUp(() {
    mockStockListRepository = MockStockListRepository();
    usecase = StockListGetlist(repository: mockStockListRepository);
  });

  const tInstitution = 1;
  final StockListModel item = StockListModel(
      id: 1, institution: 1, description: 'Principal', main: 'S', active: 'S');
  final List<StockListModel> tListStock = [item, item];
  tParams = const Params(institutionId: tInstitution);
  test(
    'should show de list of stocks from the repository',
    () async {
      //arrange
      when(mockStockListRepository.getList(institutionId: tInstitution))
          .thenAnswer((_) async => Right(tListStock));
      //act
      final result = await usecase(tParams);
      //assert
      expect(result, Right(tListStock));
      verify(mockStockListRepository.getList(institutionId: tInstitution));
      verifyNoMoreInteractions(mockStockListRepository);
    },
  );
}
