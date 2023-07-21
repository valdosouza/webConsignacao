import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:appweb/app/modules/sales_route_register/domain/repository/sales_route_register_respository.dart';
import 'package:dartz/dartz.dart';

class SalesRouteRegisterPut
    implements UseCase<SalesRouteRegisterModel, ParamsSalesRoutePut> {
  final SalesRouteRegisterRepository repository;

  SalesRouteRegisterPut({required this.repository});

  @override
  Future<Either<Failure, SalesRouteRegisterModel>> call(
      ParamsSalesRoutePut params) async {
    try {
      final list = await repository.put(model: params.model);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsSalesRoutePut {
  SalesRouteRegisterModel model;
  ParamsSalesRoutePut({required this.model});
}
