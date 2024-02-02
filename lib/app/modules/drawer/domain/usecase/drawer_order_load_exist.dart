import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/drawer/domain/repository/drawer_respository.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:dartz/dartz.dart';

class DrawerOrderLoadExist
    implements UseCase<OrderLoadCardMainModel, ParamsDrawerOrderLoadExist> {
  final DrawertRepository repository;

  DrawerOrderLoadExist({required this.repository});

  @override
  Future<Either<Failure, OrderLoadCardMainModel>> call(
      ParamsDrawerOrderLoadExist params) async {
    try {
      final list = await repository.orderLoadExist();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsDrawerOrderLoadExist {
  ParamsDrawerOrderLoadExist();
}
