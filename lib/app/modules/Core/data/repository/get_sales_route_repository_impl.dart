import 'package:appweb/app/modules/Core/data/datasource/get_sales_route_datasource.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_sales_route_repository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetSalesRouteRepositoryImpl implements GetSalesRouteRepository {
  final GetSalesRouteDatasource datasource;

  GetSalesRouteRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<SalesRouteListModel>>> getSalesRoute() async {
    try {
      final response = await datasource.getSalesRoute();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
