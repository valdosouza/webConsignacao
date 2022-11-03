import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CollaboratorGetLineBusiness implements UseCase<List<LineBusinessModel>, ParamLineBusiness> {
  final CollaboratorRegisterRespository repository;

  CollaboratorGetLineBusiness({required this.repository});

  @override
  Future<Either<Failure, List<LineBusinessModel>>> call(ParamLineBusiness params) async {
    try {
      final response = await repository.getLineBusiness(institution: params.institution);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamLineBusiness extends Equatable {
  final int institution;
  const ParamLineBusiness({required this.institution});

  @override
  List<Object?> get props => [institution];
}
