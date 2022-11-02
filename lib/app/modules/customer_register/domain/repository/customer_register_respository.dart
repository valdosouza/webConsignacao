import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_salesman_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/city_model.dart';
import 'package:appweb/app/modules/institution_register/data/model/state_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/address_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/indentification_entity.dart';
import 'package:dartz/dartz.dart';

abstract class CustomerRegisterRepository {
  Future<Either<Failure, List<CustomerListModel>>> getList({required int id});
  Future<Either<Failure, CustomerMainModel>> getCustomer({required int id});
  Future<Either<Failure, CustomerMainModel>> postCustomer(
      {required CustomerMainModel customer});
  Future<Either<Failure, List<CustomerSalesmanModel>>> getSalesmans(
      {required int id});
  Future<Either<Failure, AddressEntity>> getCEP({required String cep});
  Future<Either<Failure, IdentificationEntity>> getCnpj({required String cnpj});
  Future<Either<Failure, List<StateModel>>> getStates();
  Future<Either<Failure, List<CityModel>>> getCitys({required String id});
}
