import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class InstitutionRegisterDelete implements UseCase<String, ParamsDelete> {
  final InstitutionRegisterRespository repository;

  InstitutionRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsDelete params) async {
    try {
      final response = await repository.delete(id: params.id);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsDelete extends Equatable {
  final int id;

  const ParamsDelete({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
