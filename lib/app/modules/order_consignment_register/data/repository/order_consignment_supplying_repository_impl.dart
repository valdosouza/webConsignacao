import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/datasource/order_consignment_supplying_datasource.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/entity/order_consignment_supplying_entity.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/repository/order_consignment_supplying_repository.dart';
import 'package:dartz/dartz.dart';

import '../model/order_consignment_supplying_model.dart';

class OrderConsignmentSupplyingRepositoryImpl
    implements OrderConsignmentSupplyingRepository {
  final OrderConsignmentSupplyingDatasource orderSupplying;

  OrderConsignmentSupplyingRepositoryImpl({required this.orderSupplying});

  @override
  Future<Either<Failure, OrderConsignmentSupplyingEntity>> post(
      OrderConsignmentSupplyingModel model) async {
    try {
      return Right(await orderSupplying.post(model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderConsignmentSupplyingModel>> getlast(
      int tbCustomerId) async {
    try {
      return Right(await orderSupplying.getlast(tbCustomerId: tbCustomerId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
