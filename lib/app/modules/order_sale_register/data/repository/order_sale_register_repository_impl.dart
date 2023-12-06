import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_sale_register/data/datasource/order_sale_register_datasource.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_list_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_main_card_model.dart';
import 'package:appweb/app/modules/order_sale_register/data/model/order_sale_model.dart';
import 'package:appweb/app/modules/order_sale_register/domain/repository/order_sale_register_repository.dart';
import 'package:appweb/app/modules/order_sale_register/domain/usecase/order_sale_getlist.dart';
import 'package:dartz/dartz.dart';

class OrderSaleRegisterRepositoryImpl implements OrderSaleRegisterRepository {
  final OrderSaleRegisterDatasource datasource;

  OrderSaleRegisterRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<OrderSaleCardModel>>> getNewOrderSaleCard(
      {required int tbPriceListId}) async {
    try {
      return Right(
          await datasource.getNewOrderSaleCard(tbPriceListId: tbPriceListId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderSaleModel>> post(
      {required OrderSaleMainCardModel model}) async {
    try {
      return Right(await datasource.post(model: model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderSaleListModel>>> getlist(
      {required ParamsOrderSaleList params}) async {
    try {
      return Right(await datasource.getlist(params: params));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderSaleMainCardModel>> getOrderCard(
      int tbOrderId) async {
    try {
      return Right(await datasource.getOrderCard(tbOrderId: tbOrderId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
