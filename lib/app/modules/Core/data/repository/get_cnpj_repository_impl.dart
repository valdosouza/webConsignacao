import 'package:appweb/app/modules/Core/data/datasource/get_cnpj_datasource.dart';
import 'package:appweb/app/modules/Core/data/model/identification_company_model.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_cnpj_repository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetCnpjRepositoryImpl implements GetCnpjRepository {
  final GetCnpjDatasource datasource;

  GetCnpjRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, IdentificationCompanyModel>> getCnpj(
      {required String cnpj}) async {
    try {
      final response = await datasource.getCnpj(cnpj);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
