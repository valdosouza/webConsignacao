import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:dartz/dartz.dart';

abstract class CollaboratorRegisterRepository {
  Future<Either<Failure, CollaboratorMainModel>> get({required int id});
  Future<Either<Failure, CollaboratorMainModel>> post(
      {required CollaboratorMainModel model});
  Future<Either<Failure, String>> delete({required int id});
  Future<Either<Failure, List<CollaboratorModel>>> getlist(
      {required int tbInstitutionId});
}
