import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';

import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_repository.dart';
import 'package:dartz/dartz.dart';

class GetOrderSaleCard {
  final OrderSaleRegisterRepository repository;

  GetOrderSaleCard({required this.repository});
  Future<Either<Failure, OrderSaleMainCardModel>> call(int tbOrderId) async {
    return await repository.getOrderCard(tbOrderId);
  }
}
