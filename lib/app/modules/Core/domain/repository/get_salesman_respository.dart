import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/salesman_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class GetSalesmanRepository {
  Future<Either<Failure, List<SalesmanListModel>>> getSalesman(
      {required int tbInstitutionId});
}
