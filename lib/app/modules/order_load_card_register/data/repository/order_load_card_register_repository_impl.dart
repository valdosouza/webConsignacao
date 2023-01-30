import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_load_card_register/data/datasource/order_load_card_register_datasource.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_items_model.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:appweb/app/modules/order_load_card_register/domain/repository/order_load_card_register_repository.dart';
import 'package:dartz/dartz.dart';

class OrderLoadCardRegisterRepositoryImpl
    implements OrderLoadCardRegisterRepository {
  final OrderLoadCardRegisterDatasource orderLoadCardDatasource;

  OrderLoadCardRegisterRepositoryImpl({required this.orderLoadCardDatasource});

  @override
  Future<Either<Failure, List<OrderLoadCardItemsModel>>>
      getNewOrderLoadCard() async {
    try {
      return Right(await orderLoadCardDatasource.getNewOrderLoadCard());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderLoadCardMainModel>> post(
      {required OrderLoadCardMainModel model}) async {
    try {
      return Right(await orderLoadCardDatasource.post(model: model));
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
