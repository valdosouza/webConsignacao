import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/repository/respository.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:dartz/dartz.dart';

class GetRoute
    implements UseCase<List<SalesRouteRegisterModel>, ParamsGetRoute> {
  final Repository repository;

  GetRoute({required this.repository});

  @override
  Future<Either<Failure, List<SalesRouteRegisterModel>>> call(
      ParamsGetRoute params) async {
    try {
      final model = await repository.getRoute();
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetRoute {}
