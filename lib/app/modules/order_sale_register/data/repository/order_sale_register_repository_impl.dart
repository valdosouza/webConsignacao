import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_sale_register/data/datasources/order_sale_register_datasource.dart';
import 'package:appweb/app/modules/order_sale_register/data/models/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/models/order_sale_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderSaleRegisterRepositoryImpl implements OrderSaleRegisterRepository {
  final OrderSaleRegisterDatasource orderSaleDatasource;

  OrderSaleRegisterRepositoryImpl({required this.orderSaleDatasource});

  @override
  Future<Either<Failure, List<OrderSaleCardModel>>> getNewOrderSaleCard(
      {required int tbPriceListId}) async {
    try {
      return Right(await orderSaleDatasource.getNewOrderSaleCard(
          tbPriceListId: tbPriceListId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderSaleModel>> post(
      {required OrderSaleMainCardModel model}) async {
    try {
      return Right(await orderSaleDatasource.post(model: model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
