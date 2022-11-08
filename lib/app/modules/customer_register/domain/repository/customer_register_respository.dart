import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:dartz/dartz.dart';

abstract class CustomerRegisterRepository {
  Future<Either<Failure, List<CustomerListModel>>> getList(
      {required int tbInstitutionId});
  Future<Either<Failure, CustomerMainModel>> get({required int id});
  Future<Either<Failure, CustomerMainModel>> post(
      {required CustomerMainModel customer});
}
