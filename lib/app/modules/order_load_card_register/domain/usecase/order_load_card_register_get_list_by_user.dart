import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/repository/order_load_card_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderLoadCardRegiterGetListByUser {
  final OrderLoadCardRegisterRepository repository;

  OrderLoadCardRegiterGetListByUser({required this.repository});
  Future<Either<Failure, List<OrderConsignmetListModel>>> call() async {
    return await repository.getListByUser();
  }
}
