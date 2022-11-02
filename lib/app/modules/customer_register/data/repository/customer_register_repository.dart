import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/customer_register/data/datasource/customer_register_datasource.dart';
import 'package:appweb/app/modules/customer_register/data/model/consumer_list_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/consumer_main_model.dart';
import 'package:appweb/app/modules/customer_register/domain/repository/customer_register_respository.dart';
import 'package:appweb/app/modules/institution_register/data/model/city_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/state_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/address_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/indentification_entity.dart';
import 'package:dartz/dartz.dart';

class CustomerRegisterRepositoryImpl implements CustomerRegisterRepository {
  final CustomerRegisterDataSource datasource;

  CustomerRegisterRepositoryImpl({
    required this.datasource,
  });
  @override
  Future<Either<Failure, List<CustomerListModel>>> getList(
      {required int id}) async {
    try {
      final list = await datasource.getlist(id: id);
      return Right(list);
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

  @override
  Future<Either<Failure, CustomerMainModel>> getCustomer(
      {required int id}) async {
    try {
      final customer = await datasource.getCostumer(id: id);
      return Right(customer);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CustomerMainModel>> postCustomer(
      {required CustomerMainModel customer}) async {
    try {
      final response = await datasource.postCostumer(customer: customer);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
