import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderLoadCardRegisterRepository {
  Future<Either<Failure, String>> post({required OrderLoadCardMainModel model});

  Future<Either<Failure, List<OrderLoadCardItemsModel>>> getNewOrderLoadCard();
}
