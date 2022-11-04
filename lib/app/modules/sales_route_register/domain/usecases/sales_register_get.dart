import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/sales_route_register/data/models/sales_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../repository/sales_register_repository.dart';

class SalesRegisterGetlist implements UseCase<List<SalesModel>, Params> {
  final SalesRepository repository;

  SalesRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<SalesModel>>> call(Params params) async {
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
