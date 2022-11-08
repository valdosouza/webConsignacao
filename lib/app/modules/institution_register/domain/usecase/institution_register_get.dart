import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class InstitutionRegisterGet implements UseCase<InstitutionModel, ParamsGet> {
  final InstitutionRegisterRespository repository;

  InstitutionRegisterGet({required this.repository});

  @override
  Future<Either<Failure, InstitutionModel>> call(ParamsGet params) async {
    try {
      final response = await repository.get(id: params.id);
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
