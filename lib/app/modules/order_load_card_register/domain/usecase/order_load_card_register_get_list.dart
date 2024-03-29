import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/repository/order_load_card_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderLoadCardRegiterGetList {
  final OrderLoadCardRegisterRepository repository;

  OrderLoadCardRegiterGetList({required this.repository});
  Future<Either<Failure, List<OrderLoadCardMainModel>>> call() async {
    return await repository.getList();
  }
}
