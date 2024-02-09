import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/params.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/summary_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/repository/respository.dart';
import 'package:dartz/dartz.dart';

class Get implements UseCase<List<SummaryModel>, Params> {
  final Repository repository;
  Get({required this.repository});

  @override
  Future<Either<Failure, List<SummaryModel>>> call(Params params) async {
    try {
      final model = await repository.get(params: params);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
