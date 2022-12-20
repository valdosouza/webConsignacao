import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class EntityListGetlist
    implements UseCase<List<CustomerListModel>, ParamsGetListCustomer> {
  final OrderStockTransferRegisterRepository repository;

  EntityListGetlist({required this.repository});

  @override
  Future<Either<Failure, List<CustomerListModel>>> call(
      ParamsGetListCustomer params) async {
    try {
      final list =
          await repository.getListEntity(institutionId: params.institutionId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListCustomer extends Equatable {
  final int institutionId;

  const ParamsGetListCustomer({
    required this.institutionId,
  });

  @override
  List<Object?> get props => [institutionId];
}
