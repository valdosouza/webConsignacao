import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/datasource/order_consignment_checkpoint_datasource.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_checkpoint_model.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/repository/order_consignment_checkpoint_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentCheckpointRepositoryImpl
    implements OrderConsignmentCheckpointRepository {
  final OrderConsignmentCheckpointDatasource
      orderConsignmentCheckpointDatasource;

  OrderConsignmentCheckpointRepositoryImpl(
      {required this.orderConsignmentCheckpointDatasource});

  @override
  Future<Either<Failure, OrderConsignmentCheckpointModel>> post(
      OrderConsignmentCheckpointModel model) async {
    try {
      return Right(await orderConsignmentCheckpointDatasource.post(model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> delete(int tbOrderId) async {
    try {
      return Right(
          await orderConsignmentCheckpointDatasource.delete(tbOrderId));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
