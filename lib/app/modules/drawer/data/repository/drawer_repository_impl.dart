import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/drawer/data/datasource/drawer_datasource.dart';
import 'package:appweb/app/modules/drawer/domain/repository/drawer_respository.dart';
import 'package:appweb/app/modules/order_load_card_register/data/model/order_load_card_main_model.dart';
import 'package:dartz/dartz.dart';

class DrawerRepositoryImpl implements DrawertRepository {
  final DrawerDataSource datasource;

  DrawerRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, CashierStatusModel>> cashierIsOpen() async {
    try {
      final result = await datasource.cashierIsOpen();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderLoadCardMainModel>> orderLoadExist() async {
    try {
      final result = await datasource.orderLoadExist();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
