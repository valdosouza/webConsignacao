import 'package:appweb/app/modules/Core/data/model/address_model.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_cep_respository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCep implements UseCase<AddressModel, ParamsCep> {
  final GetCepRepository repository;

  GetCep({required this.repository});

  @override
  Future<Either<Failure, AddressModel>> call(ParamsCep params) async {
    try {
      final response = await repository.getCEP(cep: params.cep);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsCep {
  final String cep;

  const ParamsCep({
    required this.cep,
  });
}
