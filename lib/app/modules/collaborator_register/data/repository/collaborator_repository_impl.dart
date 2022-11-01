import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/collaborator_register/data/datasource/collaborator_register_datasource.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/adress_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/city_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/state_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/address_entity.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:appweb/app/modules/line_business_register/data/model/line_business_model.dart';
import 'package:dartz/dartz.dart';

class CollaboratorRegisterRespositoryImpl
    implements CollaboratorRegisterRespository {
  final CollaboratorRegisterDatasource datasource;
  //final NetworkInfo networkinfo;
  CollaboratorRegisterRespositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, CollaboratorEntity>> getCollaborator(
      {required int id}) async {
    try {
      CollaboratorEntity institution = await datasource.getCollaborator(id: id);
      return Right(institution);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CollaboratorEntity>> postCollaborator(
      {required CollaboratorModel model}) async {
    try {
      CollaboratorEntity institution =
          await datasource.postCollaborator(model: model);
      return Right(institution);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> putCollaborator(
      {required CollaboratorModel model}) async {
    try {
      String response = await datasource.putCollaborator(model: model);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteCollaborator({required int id}) async {
    try {
      String response = await datasource.deleteCollaborator(id: id);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AddressModel>> getCEP({required String cep}) async {
    try {
      AddressModel response = await datasource.getCep(cep);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CollaboratorModel>> getCnpj(
      {required String cnpj}) async {
    try {
      CollaboratorModel response = await datasource.getCnpj(cnpj);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CityModel>>> getCitys(
      {required String id}) async {
    try {
      List<CityModel> states = await datasource.getCitys(id);
      return Right(states);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<StateModel>>> getStates() async {
    try {
      List<StateModel> states = await datasource.getStates();
      return Right(states);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<LineBusinessModel>>> getLineBusiness({required int institution}) async {
    try {
      List<LineBusinessModel> lineBusiness = await datasource.getLineBusiness(institution: institution);
      return Right(lineBusiness);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, List<CollaboratorModel>>> getlistCollaborator({required int institution}) async {
    try {
      List<CollaboratorModel> collaborators = await datasource.getlistCollaborator(institution: institution);
      return Right(collaborators);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
