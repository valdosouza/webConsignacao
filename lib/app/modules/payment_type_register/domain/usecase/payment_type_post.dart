import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repository/payment_type_repository.dart';
import 'package:dartz/dartz.dart';

class PaymentTypePost
    implements UseCase<PaymentTypeModel, PostPaymentTypeParams> {
  final PaymentTypeRepository repository;

  PaymentTypePost({required this.repository});

  @override
  Future<Either<Failure, PaymentTypeModel>> call(
      PostPaymentTypeParams params) async {
    try {
      final response = await repository.post(model: params.paymentTypeId);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class PostPaymentTypeParams {
  final PaymentTypeModel paymentTypeId;

  const PostPaymentTypeParams({
    required this.paymentTypeId,
  });
}
