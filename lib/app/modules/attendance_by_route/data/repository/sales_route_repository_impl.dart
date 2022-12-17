import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/attendance_by_route/data/datasource/sales_route_datasource.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/sales_route_repository.dart';
import 'package:dartz/dartz.dart';

class SalesRouteRepositoryImpl implements SalesRouteRepository {
  final SalesRouteDataSource datasource;

  SalesRouteRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, List<SalesRouteListModel>>> getList(
      {required int institutionId}) async {
    try {
      final list = await datasource.getlist(institutionId: institutionId);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
