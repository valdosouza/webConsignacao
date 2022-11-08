import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repository/payment_type_register_repository.dart';
import 'package:dartz/dartz.dart';

class PaymentTypeRegisterGetlist
    implements UseCase<List<PaymentTypeModel>, ParamsPaymentTypeRegisterGet> {
  final PaymentTypeRegisterRepository repository;

  PaymentTypeRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<PaymentTypeModel>>> call(
      ParamsPaymentTypeRegisterGet params) async {
    try {
      final list =
          await repository.getList(institutionId: params.institutionId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPaymentTypeRegisterGet {
  int institutionId;
  ParamsPaymentTypeRegisterGet({required this.institutionId});
}
