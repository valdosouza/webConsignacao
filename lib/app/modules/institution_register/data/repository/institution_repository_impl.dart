import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/institution_register/data/datasource/institution_register_datasource.dart';
import 'package:appweb/app/modules/institution_register/data/model/city_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/state_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/address_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/indentification_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/institution_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';

class InstitutionRegisterRespositoryImpl
    implements InstitutionRegisterRespository {
  final InstitutionRegisterDatasource datasource;
  //final NetworkInfo networkinfo;
  InstitutionRegisterRespositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, InstitutionEntity>> get({required int id}) async {
    try {
      InstitutionEntity institution = await datasource.get(id: id);
      return Right(institution);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, InstitutionEntity>> post(
      {required InstitutionModel model}) async {
    try {
      InstitutionEntity institution = await datasource.post(model: model);
      return Right(institution);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> put({required InstitutionModel model}) async {
    try {
      String response = await datasource.put(model: model);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> delete({required int id}) async {
    try {
      String response = await datasource.delete(id: id);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AddressEntity>> getCEP({required String cep}) async {
    try {
      AddressEntity response = await datasource.getCep(cep);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, IdentificationEntity>> getCnpj(
      {required String cnpj}) async {
    try {
      IdentificationEntity response = await datasource.getCnpj(cnpj);
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
}
