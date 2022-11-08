import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/collaborator_list_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/datasource/collaborator_register_datasource.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:dartz/dartz.dart';

class CollaboratorRegisterRepositoryImpl
    implements CollaboratorRegisterRepository {
  final CollaboratorRegisterDatasource datasource;

  CollaboratorRegisterRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, String>> delete({required int id}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, CollaboratorMainModel>> get({required int id}) async {
    try {
      final collaborator = await datasource.get(id: id);
      return Right(collaborator);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CollaboratorListModel>>> getlist(
      {required int tbInstitutionId}) async {
    try {
      final list = await datasource.getlist(tbInstitutionId: tbInstitutionId);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CollaboratorMainModel>> post(
      {required CollaboratorMainModel model}) async {
    try {
      final response = await datasource.post(model: model);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
