import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/repository/linebusiness_register_repository.dart';
import 'package:dartz/dartz.dart';

class LinebusinessRegisterGetlist
    implements UseCase<List<LinebusinessModel>, ParamsLinebusinessRegisterGet> {
  final LinebusinessRegisterRepository repository;

  LinebusinessRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<LinebusinessModel>>> call(
      ParamsLinebusinessRegisterGet params) async {
    try {
      final list = await repository.getList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsLinebusinessRegisterGet {
  ParamsLinebusinessRegisterGet();
}
