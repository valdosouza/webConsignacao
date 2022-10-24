import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repositories/payment_type_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../data/model/payment_model.dart';

class PaymentTypeAdd extends UseCase<String, AddPaymentTypeParams> {
  final PaymentTypeRepository repository;

  PaymentTypeAdd({required this.repository});

  @override
  Future<Either<Failure, String>> call(AddPaymentTypeParams params) async {
    try {
      final response = await repository.addPaymentType(
          paymentTypeModel: params.paymentTypeModel);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class AddPaymentTypeParams {
  final PaymentTypeModel paymentTypeModel;

  const AddPaymentTypeParams({required this.paymentTypeModel});
}
