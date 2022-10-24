import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/payment_model.dart';

abstract class PaymentTypeRepository {
  Future<Either<Failure, List<PaymentTypeModel>>> getList(
      {required int institutionId});

  Future<Either<Failure, String>> addPaymentType(
      {required PaymentTypeModel paymentTypeModel});
  Future<Either<Failure, String>> putPaymentType(
      {required PaymentTypeModel paymentTypeModel});
  Future<Either<Failure, String>> deletePaymentType({required int paymentId});
}
