import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/sales_register/domain/repository/sales_register_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../data/models/sales_model.dart';

class SalesPost implements UseCase<SalesModel, SalesParams> {
  final SalesRepository repository;

  SalesPost({
    required this.repository,
  });

  @override
  Future<Either<Failure, SalesModel>> call(SalesParams params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class SalesParams {
  final SalesModel model;

  SalesParams({
    required this.model,
  });
}
