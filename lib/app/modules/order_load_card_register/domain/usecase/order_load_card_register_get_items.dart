import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/repository/order_load_card_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderLoadCardRegiterGetItems {
  final OrderLoadCardRegisterRepository repository;

  OrderLoadCardRegiterGetItems({required this.repository});
  Future<Either<Failure, List<OrderLoadCardItemsModel>>> call() async {
    return await repository.getNewOrderLoadCard();
  }
}
