import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/institution_register/data/datasource/institution_register_datasource.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/address_entity.dart';
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
  Future<Either<Failure, InstitutionEntity>> getInstitution(
      {required int id}) async {
    try {
      InstitutionEntity institution = await datasource.getInstitution(id: id);
      return Right(institution);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, InstitutionEntity>> postInstitution(
      {required InstitutionModel model}) async {
    try {
      InstitutionEntity institution =
          await datasource.postInstitution(model: model);
      return Right(institution);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> putInstitution(
      {required InstitutionModel model}) async {
    try {
      String response = await datasource.putInstitution(model: model);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> deleteInstitution({required int id}) async {
    try {
      String response = await datasource.deleteInstitution(id: id);
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
}
