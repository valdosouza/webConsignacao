import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/domain/repository/stock_list_repository.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usecase/stock_list_register_getlist.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stock_list_getlist_test.mocks.dart';

// será criada automaticament flutter pub run build_runner build
//class MockStockListRepository extends Mock implements StockListRepository {}

@GenerateMocks([StockListRepository])
void main() {
  late StockListRegisterGetlist usecase;
  late MockStockListRepository mockStockListRepository;
  late ParamsStockListGetList tParams;

  setUp(() {
    mockStockListRepository = MockStockListRepository();
    usecase = StockListRegisterGetlist(repository: mockStockListRepository);
  });

  final StockListModel item = StockListModel(
      id: 1,
      tbInstitutionId: 1,
      description: 'Principal',
      main: 'S',
      active: 'S');
  final List<StockListModel> tListStock = [item, item];
  tParams = ParamsStockListGetList();
  test(
    'should show de list of stocks from the repository',
    () async {
      //arrange
      when(mockStockListRepository.getList())
          .thenAnswer((_) async => Right(tListStock));
      //act
      final result = await usecase(tParams);
      //assert
      expect(result, Right(tListStock));
      verify(mockStockListRepository.getList());
      verifyNoMoreInteractions(mockStockListRepository);
    },
  );
}
