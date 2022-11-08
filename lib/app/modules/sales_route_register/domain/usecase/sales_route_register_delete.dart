import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/sales_route_register/domain/repository/sales_route_register_respository.dart';
import 'package:dartz/dartz.dart';

class SalesRouteRegisterDelete
    implements UseCase<String, ParamsSalesRouteDelete> {
  final SalesRouteRegisterRepository repository;

  SalesRouteRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsSalesRouteDelete params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsSalesRouteDelete {
  int id;
  ParamsSalesRouteDelete({required this.id});
}
