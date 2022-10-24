import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repositories/payment_type_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';

class PaymentTypeGetlist
    extends UseCase<List<PaymentTypeModel>, GetlistPaymentTypeParams> {
  final PaymentTypeRepository repository;

  PaymentTypeGetlist({required this.repository});

  @override
  Future<Either<Failure, List<PaymentTypeModel>>> call(
      GetlistPaymentTypeParams params) async {
    try {
      final response =
          await repository.getList(institutionId: params.idInstitution);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class GetlistPaymentTypeParams {
  final int idInstitution;

  const GetlistPaymentTypeParams({required this.idInstitution});
}
