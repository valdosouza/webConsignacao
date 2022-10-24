import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../data/model/payment_model.dart';

abstract class PaymentRepository {
  Future<Either<Failure, List<PaymentModel>>> getList(
      {required int institutionId});

  Future<Either<Failure, String>> addPayment(
      {required PaymentModel paymentModel});
  Future<Either<Failure, String>> putPayment({required PaymentModel paymentModel});
  Future<Either<Failure, String>> deletePayment({required int paymentId});
}
