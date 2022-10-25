import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repository/payment_type_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PaymentTypeDelete implements UseCase<String, DeletePayamentTypeParams> {
  final PaymentTypeRepository repository;

  PaymentTypeDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(DeletePayamentTypeParams params) async {
    try {
      final list = await repository.delete(paymentTypeId: params.paymentTypeId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class DeletePayamentTypeParams extends Equatable {
  final int paymentTypeId;

  const DeletePayamentTypeParams({
    required this.paymentTypeId,
  });

  @override
  List<Object?> get props => [paymentTypeId];
}
