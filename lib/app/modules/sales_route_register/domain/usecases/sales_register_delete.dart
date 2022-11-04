import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/sales_route_register/domain/repository/sales_register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SalesRegisterDelete
    implements UseCase<String, DeleteSalesRegisterParams> {
  final SalesRepository repository;

  SalesRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(DeleteSalesRegisterParams params) async {
    try {
      final list = await repository.delete(institutionId: params.salesId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class DeleteSalesRegisterParams extends Equatable {
  final int salesId;

  const DeleteSalesRegisterParams({
    required this.salesId,
  });

  @override
  List<Object?> get props => [salesId];
}
