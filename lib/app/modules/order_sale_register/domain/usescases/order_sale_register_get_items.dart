import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_sale_register/data/models/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_repository.dart';
import 'package:dartz/dartz.dart';

class GetNewOrderSaleCard {
  final OrderSaleRegisterRepository repository;

  GetNewOrderSaleCard({required this.repository});
  Future<Either<Failure, List<OrderSaleCardModel>>> call(
      {required int tbPriceListId}) async {
    return await repository.getNewOrderSaleCard(tbPriceListId: tbPriceListId);
  }
}
