import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';
import 'package:appweb/app/modules/institution_register/data/model/city_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/state_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/address_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/indentification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CollaboratorRegisterRespository {
  Future<Either<Failure, CollaboratorEntity>> getCollaborator({required int id});
  Future<Either<Failure, CollaboratorEntity>> postCollaborator(
      {required CollaboratorModel model});
  Future<Either<Failure, String>> putCollaborator(
      {required CollaboratorModel model});
  Future<Either<Failure, String>> deleteCollaborator({required int id});
  Future<Either<Failure, AddressEntity>> getCEP({required String cep});
  Future<Either<Failure, IdentificationEntity>> getCnpj({required String cnpj});
  Future<Either<Failure, List<StateModel>>> getStates();
  Future<Either<Failure, List<CityModel>>> getCitys({required String id});
}
