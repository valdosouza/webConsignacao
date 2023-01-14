import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/models/order_consignment_supplying_model.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/repository/order_consignment_supplying_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentSupplyingGetlast {
  final OrderConsignmentSupplyingRepository repository;

  OrderConsignmentSupplyingGetlast({required this.repository});
  Future<Either<Failure, OrderConsignmentSupplyingModel>> call(
      int tbCustomerId) async {
    return await repository.getlast(tbCustomerId);
  }
}
