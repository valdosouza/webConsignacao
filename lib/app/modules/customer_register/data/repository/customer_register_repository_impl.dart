import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/customer_register/data/datasource/customer_register_datasource.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/customer_register/data/model/customer_main_model.dart';
import 'package:appweb/app/modules/customer_register/domain/repository/customer_register_respository.dart';
import 'package:dartz/dartz.dart';

class CustomerRegisterRepositoryImpl implements CustomerRegisterRepository {
  final CustomerRegisterDataSource datasource;

  CustomerRegisterRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, CustomerMainModel>> get(
      {required int tbInstitutionId, required int id}) async {
    try {
      final customer =
          await datasource.get(tbInstitutionId: tbInstitutionId, id: id);
      return Right(customer);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CustomerListModel>> post(
      {required CustomerMainModel customer}) async {
    try {
      final response = await datasource.post(customer: customer);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CustomerListModel>>> getList(
      {required int tbInstitutionId}) async {
    try {
      final list = await datasource.getList(tbInstitutionId: tbInstitutionId);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
