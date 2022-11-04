import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repository/payment_type_register_repository.dart';
import 'package:dartz/dartz.dart';

class PaymentTypeRegisterDelete
    implements UseCase<String, ParamsPaymentTypeDelete> {
  final PaymentTypeRegisterRepository repository;

  PaymentTypeRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsPaymentTypeDelete params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPaymentTypeDelete {
  int id;
  ParamsPaymentTypeDelete({required this.id});
}
