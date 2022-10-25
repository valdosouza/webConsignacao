import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repository/payment_type_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class PaymentTypeGetlist implements UseCase<List<PaymentTypeModel>, Params> {
  final PaymentTypeRepository repository;

  PaymentTypeGetlist({required this.repository});

  @override
  Future<Either<Failure, List<PaymentTypeModel>>> call(Params params) async {
    try {
      final list =
          await repository.getList(institutionId: params.institutionId);

      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class Params extends Equatable {
  final int institutionId;

  const Params({
    required this.institutionId,
  });

  @override
  List<Object?> get props => [institutionId];
}
