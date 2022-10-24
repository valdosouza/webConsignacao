import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repositories/payment_type_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../data/model/payment_model.dart';

class PaymentTypePut extends UseCase<String, PutPaymentTypeParams> {
  final PaymentTypeRepository repository;

  PaymentTypePut({required this.repository});

  @override
  Future<Either<Failure, String>> call(PutPaymentTypeParams params) async {
    try {
      final response = await repository.putPaymentType(
          paymentTypeModel: params.paymentTypeModel);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class PutPaymentTypeParams {
  final PaymentTypeModel paymentTypeModel;

  const PutPaymentTypeParams({required this.paymentTypeModel});
}
