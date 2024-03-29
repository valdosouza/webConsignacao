import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/payment_type_register/data/datasource/remote/ownapi/payment_type_register_datasource.dart';
import 'package:appweb/app/modules/payment_type_register/data/model/payment_type_model.dart';
import 'package:appweb/app/modules/payment_type_register/domain/repository/payment_type_register_repository.dart';
import 'package:dartz/dartz.dart';

class PaymentTypeRegisterRepositoryImpl
    implements PaymentTypeRegisterRepository {
  final PaymentTypeRegisterDataSource datasource;

  //final NetworkInfo networkinfo;
  PaymentTypeRegisterRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<PaymentTypeModel>>> getList() async {
    try {
      final list = await datasource.getlist();

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PaymentTypeModel>> post(
      {required PaymentTypeModel model}) async {
    try {
      final result = await datasource.post(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> delete({required int id}) async {
    try {
      final result = await datasource.delete(id: id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PaymentTypeModel>> put(
      {required PaymentTypeModel model}) async {
    try {
      final result = await datasource.put(model: model);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
