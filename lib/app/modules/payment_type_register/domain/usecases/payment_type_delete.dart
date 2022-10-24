import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repositories/payment_type_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';

class PaymentTypeDelete extends UseCase<String, DeletePaymentTypeParams> {
  final PaymentTypeRepository repository;

  PaymentTypeDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(DeletePaymentTypeParams params) async {
    try {
      final response =
          await repository.deletePaymentType(paymentId: params.idPaymentType);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class DeletePaymentTypeParams {
  final int idPaymentType;

  const DeletePaymentTypeParams({required this.idPaymentType});
}
