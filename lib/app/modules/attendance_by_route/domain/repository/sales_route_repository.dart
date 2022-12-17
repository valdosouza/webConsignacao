import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class SalesRouteRepository {
  Future<Either<Failure, List<SalesRouteListModel>>> getList(
      {required int institutionId});
}
