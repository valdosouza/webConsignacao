import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/repository/order_load_card_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderLoadCardRegisterPost {
  final OrderLoadCardRegisterRepository repository;

  OrderLoadCardRegisterPost({required this.repository});
  Future<Either<Failure, String>> call(
      OrderLoadCardMainModel orderLoadCardMainModel) async {
    return await repository.post(model: orderLoadCardMainModel);
  }
}
