import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:appweb/app/modules/sales_route_register/domain/repository/sales_route_register_respository.dart';
import 'package:dartz/dartz.dart';

class SalesRouteRegisterPost
    implements UseCase<SalesRouteRegisterModel, ParamsSalesRoutePost> {
  final SalesRouteRegisterRepository repository;

  SalesRouteRegisterPost({required this.repository});

  @override
  Future<Either<Failure, SalesRouteRegisterModel>> call(
      ParamsSalesRoutePost params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsSalesRoutePost {
  SalesRouteRegisterModel model;
  ParamsSalesRoutePost({required this.model});
}
