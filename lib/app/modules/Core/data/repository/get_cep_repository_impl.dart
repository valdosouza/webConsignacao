import 'package:appweb/app/modules/Core/data/datasource/get_cep_datasource.dart';
import 'package:appweb/app/modules/Core/data/model/address_model.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_cep_repository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class GetCepRepositoryImpl implements GetCepRepository {
  final GetCepDatasource datasource;

  GetCepRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<Failure, AddressModel>> getCEP({required String cep}) async {
    try {
      final response = await datasource.getCep(cep);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
