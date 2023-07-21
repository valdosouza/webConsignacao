import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/sales_route_repository.dart';
import 'package:dartz/dartz.dart';

class SalesRouteGetlist
    implements UseCase<List<SalesRouteListModel>, ParamsSalesRouteGet> {
  final SalesRouteRepository repository;

  SalesRouteGetlist({required this.repository});

  @override
  Future<Either<Failure, List<SalesRouteListModel>>> call(
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
