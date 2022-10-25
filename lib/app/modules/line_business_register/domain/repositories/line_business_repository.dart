import 'package:appweb/app/modules/line_business_register/data/models/line_business_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class LineBusinessRepository{
   Future<Either<Failure, List<LineBusinessModel>>> getListLineBusiness(
      {required int institutionId});

  Future<Either<Failure, String>> addLineBusiness(
      {required LineBusinessModel lineBusinessModel});
  Future<Either<Failure, String>> putLineBusiness({required LineBusinessModel lineBusinessModel});
  Future<Either<Failure, String>> deleteLineBusiness({required int lineBusinessId});
}