import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:appweb/app/modules/sales_route_register/domain/repository/sales_route_register_respository.dart';
import 'package:dartz/dartz.dart';

class SalesRouteRegisterGetlist
    implements UseCase<List<SalesRouteRegisterModel>, ParamsSalesRouteGet> {
  final SalesRouteRegisterRepository repository;

  SalesRouteRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<SalesRouteRegisterModel>>> call(
      ParamsSalesRouteGet params) async {
    try {
      final list = await repository.getList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsSalesRouteGet {
  ParamsSalesRouteGet();
}
