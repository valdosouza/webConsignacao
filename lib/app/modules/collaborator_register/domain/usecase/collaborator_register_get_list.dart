import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/collaborator_list_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:dartz/dartz.dart';

class CollaboratorRegisterGetlist
    implements UseCase<List<CollaboratorListModel>, ParamsGetListCollaborator> {
  final CollaboratorRegisterRepository repository;

  CollaboratorRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<CollaboratorListModel>>> call(
      ParamsGetListCollaborator params) async {
    try {
      final list =
          await repository.getlist(tbInstitutionId: params.tbInstitutionId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListCollaborator {
  int tbInstitutionId;
  ParamsGetListCollaborator({required this.tbInstitutionId});
}
