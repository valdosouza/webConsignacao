import 'package:appweb/app/modules/Core/data/model/identification_company_model.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_cnpj_respository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCnpj implements UseCase<IdentificationCompanyModel, ParamsCnpj> {
  final GetCnpjRepository repository;

  GetCnpj({required this.repository});

  @override
  Future<Either<Failure, IdentificationCompanyModel>> call(
      ParamsCnpj params) async {
    try {
      final response = await repository.getCnpj(cnpj: params.cnpj);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsCnpj {
  final String cnpj;

  const ParamsCnpj({
    required this.cnpj,
  });
}
