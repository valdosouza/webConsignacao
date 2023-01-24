import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/drawer/domain/repository/drawer_respository.dart';
import 'package:dartz/dartz.dart';

class DrawerCashierIsOpen implements UseCase<bool, ParamsDrawerCashierIsOpen> {
  final DrawertRepository repository;

  DrawerCashierIsOpen({required this.repository});

  @override
  Future<Either<Failure, bool>> call(ParamsDrawerCashierIsOpen params) async {
    try {
      final list = await repository.cashierIsOpen();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsDrawerCashierIsOpen {
  ParamsDrawerCashierIsOpen();
}
