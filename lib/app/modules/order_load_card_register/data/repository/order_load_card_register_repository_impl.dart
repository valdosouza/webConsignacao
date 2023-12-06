import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:appweb/app/modules/order_load_card_register/data/datasource/order_load_card_register_datasource.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/repository/order_load_card_register_repository.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/get_new_order_load_card.dart';
import 'package:dartz/dartz.dart';

class OrderLoadCardRegisterRepositoryImpl
    implements OrderLoadCardRegisterRepository {
  final OrderLoadCardRegisterDatasource datasource;

  OrderLoadCardRegisterRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, OrderLoadCardMainModel>> getNewOrderLoadCard(
      {required ParamsGetNewOrderLoadCard params}) async {
    try {
      return Right(await datasource.getNewOrderLoadCard(params: params));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderLoadCardMainModel>>> getList() async {
    try {
      return Right(await datasource.getList());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderLoadCardMainModel>> get(
      {required int orderId}) async {
    try {
      return Right(await datasource.get(orderId: orderId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderConsignmetListModel>>>
      getListByUser() async {
    try {
      return Right(await datasource.getListByUser());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> post(
      {required OrderLoadCardMainModel model}) async {
    try {
      return Right(await datasource.post(model: model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> closure(
      {required OrderLoadCardMainModel model}) async {
    try {
      return Right(await datasource.closure(model: model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CashierStatusModel>> cashierIsOpen() async {
    try {
      final result = await datasource.cashierIsOpen();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
