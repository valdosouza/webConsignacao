import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/entity/order_consignment_supplying_entity.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/repository/order_consignment_supplying_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentSupplyingPost {
  final OrderConsignmentSupplyingRepository repository;

  OrderConsignmentSupplyingPost({required this.repository});
  Future<Either<Failure, OrderConsignmentSupplyingEntity>> call(
      OrderConsignmentSupplyingModel orderConsignmentSupplyingModel) async {
    return await repository.post(orderConsignmentSupplyingModel);
  }
}
