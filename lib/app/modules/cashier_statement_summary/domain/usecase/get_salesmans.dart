import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/repository/respository.dart';
import 'package:dartz/dartz.dart';

class GetSalesmans implements UseCase<List<SalesmanModel>, String> {
  final Repository repository;
  GetSalesmans({required this.repository});

  @override
  Future<Either<Failure, List<SalesmanModel>>> call(String params) async {
    try {
      final model = await repository.getSalesman();
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
