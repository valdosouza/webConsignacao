import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/repository/order_load_card_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderLoadCardRegiterGet {
  final OrderLoadCardRegisterRepository repository;

  OrderLoadCardRegiterGet({required this.repository});
  Future<Either<Failure, OrderLoadCardMainModel>> call(
      {required int orderId}) async {
    return await repository.get(orderId: orderId);
  }
}
