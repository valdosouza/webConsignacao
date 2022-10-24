import 'package:appweb/app/modules/line_business_register/domain/entities/line_business.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class LineBusinessRepository{
   Future<Either<Failure, List<LineBusinessEntity>>> getList(
      {required int institutionId});

  Future<Either<Failure, String>> addPayment(
      {required LineBusinessEntity lineBusinessEntity});
  Future<Either<Failure, String>> putPayment({required LineBusinessEntity lineBusinessEntity});
  Future<Either<Failure, String>> deletePayment({required int lineBusinessId});
}