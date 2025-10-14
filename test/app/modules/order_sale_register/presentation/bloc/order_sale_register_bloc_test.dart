import 'package:dartz/dartz.dart';


import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_bloc.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_event.dart';
import 'package:appweb/app/modules/order_sale_register/presentation/bloc/order_sale_register_state.dart';

import 'order_sale_register_bloc_test_mocks.dart';

void main() {
  late MockNewOrderSaleCard mockOrderSaleRegisterGetItems;
  late MockOrderSaleRegisterPost mockOrderSaleRegisterPost;
  late MockOrderSaleGetList mockOrderSaleGetList;
  late MockGetOrderSaleCard mockGetOrderSaleCard;

  late OrderSaleRegisterBloc bloc;

  setUp(() {
    mockOrderSaleRegisterGetItems = MockNewOrderSaleCard();
    mockOrderSaleRegisterPost = MockOrderSaleRegisterPost();
    mockOrderSaleGetList = MockOrderSaleGetList();
    mockGetOrderSaleCard = MockGetOrderSaleCard();

    bloc = OrderSaleRegisterBloc(
      getNewOrderSaleCard: mockOrderSaleRegisterGetItems,
      postOrderSale: mockOrderSaleRegisterPost,
      orderSaleGetlist: mockOrderSaleGetList,
      getOrderSaleCard: mockGetOrderSaleCard,
    );
  });

  tearDown(() => bloc.close());

  group('ordersaleCardPos', () {
    blocTest<OrderSaleRegisterBloc, OrderSaleRegisterState>(
      'emite Sucesso quando postOrderSale retorna ok',
      build: () {
        // ajusta o retorno conforme assinatura real do usecase
        //when(() => mockOrderSaleRegisterPost(any()))
        //    .thenAnswer((_) async => true);
        return bloc;
      },
      //act: (b) => b.add(OrderSaleCardPostEvent()),
      act: (b) => b.add(OrderSaleCardPostEvent(model: bloc.modelOrderSale)),
      expect: () => [
        isA<OrderSaleRegisterLoadingState>(),
        isA<OrderSaleCardPostSucessState>(),
      ],
    );

    blocTest<OrderSaleRegisterBloc, OrderSaleRegisterState>(
      'emite Erro quando postOrderSale lança exceção',
      build: () {
        when(() => mockOrderSaleRegisterPost(any()))
            .thenThrow(Exception('erro'));
        return bloc;
      },
      //act: (b) => b.add(OrderSaleCardPostEvent()),
      act: (b) => b.add(OrderSaleCardPostEvent(model: bloc.modelOrderSale)),
      expect: () => [
        isA<OrderSaleRegisterLoadingState>(),
        isA<OrderSaleCardPostErrorState>(),
      ],
    );
  });
}
