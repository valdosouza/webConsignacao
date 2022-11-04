import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/sales_route_register/data/models/sales_model.dart';
import 'package:appweb/app/modules/sales_route_register/domain/repository/sales_register_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';

class SalesRegisterPut implements UseCase<String, PutSaleSregisterParams> {
  final SalesRepository repository;

  SalesRegisterPut({required this.repository});

  @override
  Future<Either<Failure, String>> call(PutSaleSregisterParams params) async {
    try {
      final response = await repository.put(model: params.salesParams);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class PutSaleSregisterParams {
  final SalesModel salesParams;

  const PutSaleSregisterParams({
    required this.salesParams,
  });
}
