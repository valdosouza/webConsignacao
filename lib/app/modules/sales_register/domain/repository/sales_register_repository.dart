import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/sales_register/data/models/sales_model.dart';
import 'package:dartz/dartz.dart';

abstract class SalesRepository {
  Future<Either<Failure, SalesModel>> post({
    required SalesModel model,
  });
}
