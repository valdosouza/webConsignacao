import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CollaboratorGetCnpj implements UseCase<CollaboratorModel, ParamsCnpj> {
  final CollaboratorRegisterRespository repository;

  CollaboratorGetCnpj({required this.repository});

  @override
  Future<Either<Failure, CollaboratorModel>> call(ParamsCnpj params) async {
    try {
      final response = await repository.getCnpj(cnpj: params.cnpj);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsCnpj extends Equatable {
  final String cnpj;

  const ParamsCnpj({
    required this.cnpj,
  });

  @override
  List<Object?> get props => [cnpj];
}
