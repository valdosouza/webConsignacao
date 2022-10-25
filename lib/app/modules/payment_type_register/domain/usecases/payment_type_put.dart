import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repositories/payment_type_repository.dart';
import 'package:dartz/dartz.dart';

class PaymentTypePut implements UseCase<String, PutPaymentTypeParams> {
  final PaymentTypeRepository repository;

  PaymentTypePut({required this.repository});

  @override
  Future<Either<Failure, String>> call(PutPaymentTypeParams params) async {
    try {
      final response = await repository.put(model: params.paymentType);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class PutPaymentTypeParams {
  final PaymentTypeModel paymentType;

  const PutPaymentTypeParams({
    required this.paymentType,
  });
}
