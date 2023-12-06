import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_getlist.dart';
import 'package:dartz/dartz.dart';

abstract class OrderSaleRegisterRepository {
  Future<Either<Failure, OrderSaleModel>> post(
      {required OrderSaleMainCardModel model});

  Future<Either<Failure, List<OrderSaleCardModel>>> getNewOrderSaleCard(
      {required int tbPriceListId});

  Future<Either<Failure, List<OrderSaleListModel>>> getlist(
      {required ParamsOrderSaleList params});

  Future<Either<Failure, OrderSaleMainCardModel>> getOrderCard(int tbOrderId);
}
