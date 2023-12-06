import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/order_consignment_register/data/model/order_consignment_list_model.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/usecase/get_new_order_load_card.dart';
import 'package:dartz/dartz.dart';

abstract class OrderLoadCardRegisterRepository {
  Future<Either<Failure, String>> post({required OrderLoadCardMainModel model});

  Future<Either<Failure, OrderLoadCardMainModel>> getNewOrderLoadCard(
      {required ParamsGetNewOrderLoadCard params});
  Future<Either<Failure, List<OrderLoadCardMainModel>>> getList();

  Future<Either<Failure, OrderLoadCardMainModel>> get({required int orderId});

  Future<Either<Failure, List<OrderConsignmetListModel>>> getListByUser();

  Future<Either<Failure, String>> closure(
      {required OrderLoadCardMainModel model});

  Future<Either<Failure, CashierStatusModel>> cashierIsOpen();
}
