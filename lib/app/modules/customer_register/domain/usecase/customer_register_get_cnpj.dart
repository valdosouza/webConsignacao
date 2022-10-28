import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/customer_register/domain/repository/customer_register_respository.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/indentification_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CustomerRegisterGetCnpj
    implements UseCase<IdentificationEntity, ParamsCnpj> {
  final CustomerRegisterRepository repository;

  CustomerRegisterGetCnpj({required this.repository});

  @override
  Future<Either<Failure, IdentificationEntity>> call(ParamsCnpj params) async {
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
