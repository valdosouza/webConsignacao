import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/institution_register/data/model/city_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/state_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/address_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/indentification_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/institution_entity.dart';
import 'package:dartz/dartz.dart';

abstract class InstitutionRegisterRespository {
  Future<Either<Failure, InstitutionEntity>> getInstitution({required int id});
  Future<Either<Failure, InstitutionEntity>> postInstitution(
      {required InstitutionModel model});
  Future<Either<Failure, String>> putInstitution(
      {required InstitutionModel model});
  Future<Either<Failure, String>> deleteInstitution({required int id});
  Future<Either<Failure, AddressEntity>> getCEP({required String cep});
  Future<Either<Failure, IdentificationEntity>> getCnpj({required String cnpj});
  Future<Either<Failure, List<StateModel>>> getStates();
  Future<Either<Failure, List<CityModel>>> getCitys({required String id});
}
