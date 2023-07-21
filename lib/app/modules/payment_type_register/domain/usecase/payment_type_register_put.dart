import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repository/payment_type_register_repository.dart';
import 'package:dartz/dartz.dart';

class PaymentTypeRegisterPut
    implements UseCase<PaymentTypeModel, ParamsPaymentTypePut> {
  final PaymentTypeRegisterRepository repository;

  PaymentTypeRegisterPut({required this.repository});

  @override
  Future<Either<Failure, PaymentTypeModel>> call(
      ParamsPaymentTypePut params) async {
    try {
      final response = await repository.put(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPaymentTypePut {
  PaymentTypeModel model;
  ParamsPaymentTypePut({required this.model});
}
