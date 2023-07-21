import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repository/payment_type_register_repository.dart';
import 'package:dartz/dartz.dart';

class PaymentTypeRegisterPost
    implements UseCase<PaymentTypeModel, ParamsPaymentTypePost> {
  final PaymentTypeRegisterRepository repository;

  PaymentTypeRegisterPost({required this.repository});

  @override
  Future<Either<Failure, PaymentTypeModel>> call(
      ParamsPaymentTypePost params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPaymentTypePost {
  PaymentTypeModel model;
  ParamsPaymentTypePost({required this.model});
}
