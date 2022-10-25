import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/institution_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class InstitutionRegisterGet implements UseCase<InstitutionEntity, ParamsGet> {
  final InstitutionRegisterRespository repository;

  InstitutionRegisterGet({required this.repository});

  @override
  Future<Either<Failure, InstitutionEntity>> call(ParamsGet params) async {
    try {
      final response = await repository.getInstitution(id: params.id);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGet extends Equatable {
  final int id;

  const ParamsGet({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
