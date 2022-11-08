import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:dartz/dartz.dart';

abstract class InstitutionRegisterRespository {
  Future<Either<Failure, InstitutionModel>> get({required int id});
  Future<Either<Failure, InstitutionModel>> post(
      {required InstitutionModel model});
  Future<Either<Failure, String>> put({required InstitutionModel model});
  Future<Either<Failure, String>> delete({required int id});
}
