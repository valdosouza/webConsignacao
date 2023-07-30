import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/datasource/order_consignment_datasource.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/repository/order_consignment_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentRepositoryImpl implements OrderConsignmentRepository {
  final OrderConsignmentDatasource orderConsignment;

  OrderConsignmentRepositoryImpl({required this.orderConsignment});

  @override
  Future<Either<Failure, List<OrderConsignmetListModel>>> getlist(
      int tbCustomerId) async {
    try {
      return Right(await orderConsignment.getlist(tbCustomerId: tbCustomerId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderConsignmentCheckpointModel>> getCheckpoint(
      int tbOrderId) async {
    try {
      return Right(await orderConsignment.getCheckpoint(tbOrderId: tbOrderId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderConsignmentSupplyingModel>> getSupplying(
      int tbOrderId) async {
    try {
      return Right(await orderConsignment.getSupplying(tbOrderId: tbOrderId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
