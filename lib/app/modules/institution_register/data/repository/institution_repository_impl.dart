import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/institution_register/data/datasource/institution_register_datasource.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
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
  Future<Either<Failure, InstitutionModel>> get({required int id}) async {
    try {
      InstitutionModel institution = await datasource.get(id: id);
      return Right(institution);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, InstitutionModel>> post(
      {required InstitutionModel model}) async {
    try {
      InstitutionModel institution = await datasource.post(model: model);
      return Right(institution);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, InstitutionModel>> put(
      {required InstitutionModel model}) async {
    try {
      InstitutionModel response = await datasource.put(model: model);
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
}
