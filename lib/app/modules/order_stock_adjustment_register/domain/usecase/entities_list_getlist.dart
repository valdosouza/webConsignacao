import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/domain/repository/order_stock_adjustment_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class EntitiesListGetlist
    implements UseCase<List<EntityListModel>, ParamsGetListEntities> {
  final OrderStockAdjustmentRegisterRepository repository;

  EntitiesListGetlist({required this.repository});

  @override
  Future<Either<Failure, List<EntityListModel>>> call(
      ParamsGetListEntities params) async {
    try {
      final list = await repository.getListEntities();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListEntities extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
