import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment/data/model/payment_model.dart';
import 'package:appweb/app/modules/payment/domain/repositories/payment_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';

class PaymentGetlist extends UseCase<List<PaymentModel>, GetlistPaymentParams>{
final PaymentRepository repository;

  PaymentGetlist({required this.repository});

  @override
  Future<Either<Failure, List<PaymentModel>>>  call(GetlistPaymentParams params) async {
    try {
      final response = await repository.getList(institutionId: params.idInstitution);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  
}


class GetlistPaymentParams {
  final int idInstitution ;

  const GetlistPaymentParams({required this.idInstitution});
}
