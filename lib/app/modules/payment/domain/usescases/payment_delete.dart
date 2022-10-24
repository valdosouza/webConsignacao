import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment/domain/repositories/payment_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';

class PaymentDelete extends UseCase<String, DeletePaymentParams> {
  final PaymentRepository repository;

  PaymentDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(DeletePaymentParams params) async {
    try {
      final response =
          await repository.deletePayment(paymentId: params.idPayment);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class DeletePaymentParams {
  final int idPayment;

  const DeletePaymentParams({required this.idPayment});
}
