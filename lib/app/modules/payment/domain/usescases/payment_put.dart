import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment/domain/repositories/payment_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../data/model/payment_model.dart';

class PaymentPut extends UseCase<String, PutPaymentParams> {
  final PaymentRepository repository;

  PaymentPut({required this.repository});

  @override
  Future<Either<Failure, String>> call(PutPaymentParams params) async {
    try {
      final response =
          await repository.putPayment(paymentModel: params.paymentModel);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class PutPaymentParams {
  final PaymentModel paymentModel;

  const PutPaymentParams({required this.paymentModel});
}
