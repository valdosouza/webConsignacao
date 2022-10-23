import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment/domain/repositories/payment_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../data/model/payment_model.dart';

class PaymentAdd extends UseCase<String, AddPaymentParams>{
  final PaymentRepository repository;

  PaymentAdd({required this.repository});

  @override
  Future<Either<Failure, String>> call(AddPaymentParams params) async {
    try {
      final response = await repository.addPayment(idInstitution: params.idInstitution ,description: params.description);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  
}


class AddPaymentParams {
  final String description;
  final int idInstitution;

  const AddPaymentParams({required this.idInstitution, required this.description});
}
