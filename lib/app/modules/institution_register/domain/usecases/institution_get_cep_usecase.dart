import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/address_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class InstitutionGetCep implements UseCase<AddressEntity, ParamsCep> {
  final InstitutionRegisterRespository repository;

  InstitutionGetCep({required this.repository});

  @override
  Future<Either<Failure, AddressEntity>> call(ParamsCep params) async {
    try {
      final response = await repository.getCEP(cep: params.cep);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsCep extends Equatable {
  final String cep;

  const ParamsCep({
    required this.cep,
  });

  @override
  List<Object?> get props => [cep];
}
