import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_sale_register/data/models/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/models/order_sale_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderSaleRegisterRepository {
  Future<Either<Failure, OrderSaleModel>> post(
      {required OrderSaleMainCardModel model});

  Future<Either<Failure, List<OrderSaleCardModel>>> getNewOrderSaleCard(
      {required int tbInstitutionId, required int tbPriceListId});
}
