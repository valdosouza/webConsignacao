import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:appweb/app/modules/order_consignment_register/domain/repository/order_consignment_repository.dart';
import 'package:dartz/dartz.dart';

class OrderConsignmentGetlist {
  final OrderConsignmentRepository repository;

  OrderConsignmentGetlist({required this.repository});
  Future<Either<Failure, List<OrderConsignmetListModel>>> call(
      int tbCustomerId) async {
    return await repository.getlist(tbCustomerId);
  }
}
