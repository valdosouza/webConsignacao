import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_sales_route_respository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetSalesRoute
    implements UseCase<List<SalesRouteListModel>, ParamsSalesRouteListGet> {
  final GetSalesRouteRepository repository;

  GetSalesRoute({required this.repository});

  @override
  Future<Either<Failure, List<SalesRouteListModel>>> call(
      ParamsSalesRouteListGet params) async {
    try {
      final list = await repository.getSalesRoute(
          tbInstitutionId: params.tbInstitutionId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsSalesRouteListGet {
  int tbInstitutionId;
  ParamsSalesRouteListGet({required this.tbInstitutionId});
}
