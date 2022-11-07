import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/adress_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/city_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/state_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';

import 'package:dartz/dartz.dart';

abstract class CollaboratorRegisterRespository {
  Future<Either<Failure, CollaboratorEntity>> getCollaborator({required int id});
  Future<Either<Failure, String>> postCollaborator(
      {required CollaboratorModel model});
  Future<Either<Failure, String>> deleteCollaborator({required int id});
  Future<Either<Failure, AddressModel>> getCEP({required String cep});
  Future<Either<Failure, List<StateModel>>> getStates();
  Future<Either<Failure, List<CityModel>>> getCitys({required String id});
  Future<Either<Failure, List<LineBusinessModel>>> getLineBusiness({required int institution});
  Future<Either<Failure, List<CollaboratorModel>>> getlistCollaborator({required int institution});
}